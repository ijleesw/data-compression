
#include <iostream>

#include "common.h"
#include "arithmetic_encoder.h"
#include "arithmetic_decoder.h"

#include "difference_adaptive_model.h"
#include "adaptive_model.h"

#include <iostream>
#include <fstream>
#include <stdio.h>

using namespace std;


char* enc_szInputName = NULL;
char* enc_szOutputName = NULL;

char* dec_szInputName = NULL;
char* dec_szOutputName = NULL;


void encode_BYTE(char* szInputName, char* szOutputName)
{
  file_map<BYTE> map_input(szInputName);
  file_writer<bit> file_comp_out;
  file_comp_out.create(szOutputName);

  arithmetic_encoder enc(&file_comp_out);
  adaptive_model<BYTE> mdl(&enc);

  DWORD adwHeader[2];
  
  adwHeader[0] = g_dwMagic;
  adwHeader[1] = map_input.get_size();

  file_comp_out.write_header((BYTE*)adwHeader, sizeof(adwHeader));
  
  for(;;)
  {
    BYTE b = map_input.read_next();
    if (map_input.eof()) 
    {
      mdl.encode_symbol(b);
      break;
    }
    mdl.encode_symbol(b);
  }
  BYTE b = map_input.read_next();
  mdl.encode_symbol(b);
  mdl.encode_eof();
}



void decode_BYTE(char* szInputName, char* szOutputName)
{
  file_map<bit> map_comp_input(szInputName);
  file_writer<BYTE> file_out;
  file_out.create(szOutputName);
  
  arithmetic_decoder dec(&map_comp_input);
  adaptive_model<BYTE> mdl(&dec);

  DWORD* dwBuffer = (DWORD*)map_comp_input.get_header();
  
  DWORD dwExpSize = dwBuffer[1];

  if (dwBuffer[0] == g_dwMagic)
  {
    for(DWORD i = 0; i < (dwExpSize / sizeof(BYTE)); ++i)
    {
      BYTE b = mdl.decode_symbol();
      file_out.send(b);
    }
  }
}



int main(int argc, char** argv)
{
	if (argc < 4) {
		cout << "Usage: "<<argv[0]<<" <input path> <compression path> <decompression path>\n";
		return -1;
	}

	enc_szInputName = argv[1];
	enc_szOutputName = argv[2];
	dec_szInputName = argv[2];
	dec_szOutputName = argv[3];

	encode_BYTE(enc_szInputName, enc_szOutputName);
	decode_BYTE(dec_szInputName, dec_szOutputName);

	return 0;
}
