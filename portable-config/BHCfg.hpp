#ifndef __BH_CFG_HPP__
#define __BH_CFG_HPP__

#include <map>
#include <string>
#include <cmath>
#include <sstream>
#include <fstream>

const std::string INFILE = "in.cfg";
const std::string OUTFILE = "out.cfg";

std::string getfilepath(const std::string dirpath, const std::string filename)
{
    std::stringstream ss;
#ifdef __linux__
    const char path_sep = '/';
#elif __WIN32__
    const char path_sep = '\\';
#else
    abc123
#endif

    ss << dirpath;
    ss << path_sep;
    ss << filename;
    return ss.str();
}
namespace
{
    std::string rtrim(const std::string& str)
    {
        size_t pos = str.length() - 1;
        while ( std::isspace(str[pos])) --pos;
        const size_t len = pos + 1;
        std::string t_str = str.substr(0, len);
        return t_str;
    }

    std::string ltrim(const std::string& str)
    {
        size_t pos = 0;
        while ( std::isspace(str[pos])) ++pos;
        std::string t_str = str.substr(pos);
        return t_str;
    }

    std::string remove_quotes(const std::string& str)
    {
        //No-op
        return str;
    }

    std::string trim(const std::string& str)
    {
        return ltrim(rtrim(str));
    }

    std::string strip_comment(const std::string& str)
    {
        size_t idx_first_hash = str.find_first_of('#'); 

        if ( idx_first_hash == std::string::npos ) return str;

        std::string ret;

        ret = std::string(str, 0, idx_first_hash);


        return ret;
    }

    bool tokenize(const std::string str, std::string& name, std::string& value)
    {
        //if ( str.find_first_of('#') != std::string::npos ) return false;
        std::string removed_comment = strip_comment(str);
        if ( removed_comment.empty() ) return false;

        size_t equals_pos = removed_comment.find_first_of('=');
        name = trim(removed_comment.substr(0, equals_pos));
        value = trim(removed_comment.substr( equals_pos + 1));
        return true;
    }
}

typedef std::map<std::string, std::string> CfgMapType;

bool readCfg(const std::string& infile, CfgMapType& cfg_map)
{
    std::ifstream instream (infile.c_str());
    if ( ! instream.good() )
        return false;
    std::string line;

    int line_no = 0;
    while ( std::getline(instream, line)) //Go through the file line by line
    {
        line_no++;
        std::string name, value;
        if ( tokenize(line, name, value) )
        {
            cfg_map[name] = value;
        }
        else
        {
            //fprintf(stdout, "ignoring [%s]\n", line.c_str());
        }
    }
    return true;
}

void dumpCfg(CfgMapType& cfg_map)
{
    for( auto kv: cfg_map )
    {
        printf("X: key [%s] value [%s]\n", kv.first.c_str(), kv.second.c_str());

    }
}

bool writeCfg(const std::string& outfile, const CfgMapType& cfg_map)
{
    //open file
    FILE* fout = fopen(outfile.c_str(), "w");
    if ( ! fout ) return false;


    for ( auto kv: cfg_map) //Foreach key
    {
        fprintf(fout, "%s = %s\n", kv.first.c_str(), kv.second.c_str()); //Write data as string
    }

    fclose(fout); //close file 
    return true;

}



class BHConfig
{
    std::string infilePath;
    std::string outfilePath;
public:
    BHConfig()
    {
#ifdef __WIN32__
        abc123;
#else
        const std::string dirname = "/tmp/";
#endif

        infilePath = getfilepath(dirname, INFILE);
        outfilePath = getfilepath(dirname, OUTFILE);
    }

    CfgMapType cfg_map;

    bool init()
    {
        printf("%s:%d %s\n", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        if ( ! readUserConfig() )
        {
            return false;
        }

        if ( ! this->writeNewConfig() )
        {
            return false;
        }

        printf("%s:%d %s\n", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        return true;
    }

    //bool writeDefaults()
    //{

    //}

    bool readUserConfig()
    {
        printf("%s:%d %s\n", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        const std::string infile = INFILE;
        if ( readCfg(infile, cfg_map) )
        {
            dumpCfg(cfg_map);
            printf("%s:%d %s\n", __FILE__, __LINE__, __PRETTY_FUNCTION__);
            return true;
        }

        printf("%s:%d %s\n", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        return false;
    }

    bool writeNewConfig()
    {
        
        const std::string outfile = "./out.cfg";
        writeCfg(outfile, cfg_map);
    }

    bool getValue(const char* key, std::string& val)
    {
        val.clear();

        auto it = cfg_map.find(key);
        if ( it != cfg_map.end() )
        {
            printf("%s:%d %s\n", __FILE__, __LINE__, __PRETTY_FUNCTION__);
            val = it->second;
            return true;
        }
        printf("%s:%d %s\n", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        return false;
    }

    int getInt(const char* key)
    {
        std::string val;
        if ( this->getValue(key, val) )
        {
            return atoi(val.c_str());
        }
        return -1;

    }

    float getFloat(const char* key)
    {
        std::string val;
        if ( this->getValue(key, val) )
        {
            return atof(val.c_str());
        }
        return NAN;

    }

    std::string getString(const char* key)
    {
        std::string val;
        printf("%s:%d %s\n", __FILE__, __LINE__, __PRETTY_FUNCTION__);
        if ( this->getValue(key, val) )
        {
            return val;
        }
        return std::string();
    }

};

#endif
