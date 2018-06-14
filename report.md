# Topics on Algorithms (Data Compression) Class Project

This is a report for team project of Topics on Algorithms (Data Compression) Spring 2018 by Seok Won Lee and Chae Min Ahn.



## How to Run

Run `test.sh` in terminal. If malloc error occurs in tunstall, run `tunstall.sh`.

All codes were tested on macOS Sierra 10.12.5.



## Static Huffman Coding  

### 1. Review of Algorithm



### 2. Description of Code



## Adaptive Huffman Coding (FGK) 

#### 1. Review of Algorithm

asdfasdf

#### 2. Description of Code



## Golomb Code

#### 1. Review of Algorithm

asdfasdf

#### 2. Description of Code



## Tunstall Code

#### 1. Review of Algorithm

asdfasdf

#### 2. Description of Code



## Arithmetic Coding

#### 1. Review of Algorithm

asdfasdf

#### 2. Description of Code

asfd



## LZ Family

#### 1. Review of Algorithm

asdfasdf

#### 2. Description of Code

asfd



## Dataset Preprocessing

For Tunstall code, Golomb code, arithmetic coding, LZ78 and LZW, datasets are treated as a bytestream. For other algorithms, datasets are treated as a stream of Latin-1 encoding.



## Experimental Results

Compression Algorithms :

|                      |   file name   |      SD1      |       SD2       |       SD3       |       SD4       |       DNA       |    ENGLISH     |       XML       |
| :------------------: | :-----------: | :-----------: | :-------------: | :-------------: | :-------------: | :-------------: | :------------: | :-------------: |
|     **Dataset**      | alphabet size |      255      |       64        |       16        |        4        |     16 (12)     |    239 (96)    |     97 (92)     |
|                      |   file size   | 32 kb (32768) | 128 kb (131072) | 512 kb (524288) | 2 mb (2097152)  | 512 kb (524288) | 4 mb (4194304) | 1 mb (1048576)  |
|                      |  actual size  | 32 kb (32768) |  96 kb (98304)  | 256 kb (262144) | 512 kb (524388) | 256 kb (262144) | 4 mb (2670016) | 896 kb (917504) |
|     **Tunstall**     | alphabet size |      256      |       253       |       241       |       253       |       99        |      185       |       174       |
|                      |      174      |     33289     |     125272      |     270677      |     526409      |     171596      |    3512202     |     982146      |
|                      |  actual size  |     33289     |     125272      |     270677      |     526409      |     150146      |    3512202     |     982146      |
|                      |     ratio     |    101.590    |     127.433     |     103.255     |     100.405     |     57.276      |     95.700     |     107.045     |
|      **Golomb**      | alphabet size |      252      |       255       |       228       |       100       |       84        |      241       |       234       |
|                      |   file size   |     38322     |     131322      |     437387      |     1310590     |     481347      |    4629271     |     1217329     |
|                      |  actual size  |     38322     |     131322      |     437387      |     1146766     |     421178      |    4629271     |     1217329     |
|                      |     ratio     |    116.949    |     133.588     |     166.850     |     218.728     |     160.667     |    126.138     |     132.678     |
|    **Arithmetic**    | alphabet size |      256      |       256       |       256       |       256       |       256       |      256       |       256       |
|                      |   file size   |     32850     |      98591      |     262535      |     524756      |     130571      |    2357989     |     684756      |
|                      |  actual size  |     32850     |      98591      |     262535      |     524756      |     130571      |    2357989     |     684756      |
|                      |     ratio     |    100.250    |     100.292     |     100.149     |     100.089     |   **49.809**    |     64.250     |     74.632      |
|       **LZ77**       | alphabet size |      256      |       65        |       17        |       11        |       21        |      105       |       101       |
|                      |   file size   |     98298     |     391575      |     1472910     |     3205596     |     736191      |    11523537    |     2783274     |
|                      |  actual size  |     98298     |     342628      |     920568      |     1602798     |     460119      |    10083094    |     2435364     |
|                      |     ratio     |    299.982    |     348.539     |     351.169     |     305.709     |     175.521     |    274.743     |     265.434     |
|       **LZ78**       | alphabet size |      256      |       256       |       256       |       256       |       256       |      256       |       256       |
|                      |   file size   |     46158     |     133283      |     319251      |     604808      |     145009      |    2112228     |     366741      |
|                      |  actual size  |     46158     |     133283      |     319251      |     604808      |     145009      |    2112228     |     366741      |
|                      |     ratio     |    140.863    |     135.582     |     121.785     |     115.358     |     55.317      |   **57.554**   |   **39.972**    |
|       **LZSS**       | alphabet size |      256      |       65        |       17        |       11        |       22        |      106       |       102       |
|                      |   file size   |     66816     |     280523      |     1245167     |     4011153     |     926897      |    9601214     |     2201309     |
|                      |    actual     |     66816     |     245457      |     778229      |     2005576     |     579310      |    8401062     |     1926145     |
|                      |     ratio     |    203.906    |     249.692     |     296.871     |     382.533     |     220.989     |    228.911     |     209.933     |
|       **LZW**        | alphabet size |      256      |       256       |       256       |       256       |       256       |      256       |       256       |
|                      |   file size   |     44833     |     136804      |     328359      |     624223      |     149529      |    2228515     |     412225      |
|                      |  actual size  |     44833     |     136804      |     328359      |     624223      |     149529      |    2228515     |     412225      |
|                      |     ratio     |    136.819    |     139.164     |     125.259     |     119.061     |     57.041      |   **60.722**   |   **44.929**    |
|  **Static Huffman**  | alphabet size |      256      |       256       |       256       |       256       |       216       |      256       |       256       |
|                      |   file size   |     32749     |      98306      |     262146      |     524290      |     144856      |    2374710     |     688748      |
|                      |  actual size  |     32749     |      98306      |     262146      |     524290      |     144856      |    2374710     |     688748      |
|                      |     ratio     |  **99.942**   |   **100.002**   |   **100.001**   |   **100.000**   |     55.258      |     64.706     |     75.068      |
| **Adaptive Huffman** | alphabet size |               |                 |                 |                 |                 |                |                 |
|                      |   file size   |     33093     |      98636      |     266266      |     589817      |     144873      |    2374877     |     688900      |
|                      |    actual     |     33093     |      98636      |     266266      |     589817      |     144873      |    2374877     |     688900      |
|                      |     ratio     |    100.992    |     100.338     |     101.572     |     112.499     |     55.265      |     64.710     |     75.084      |



Builtin Compressors :

|             |   file name   |      SD1      |       SD2       |       SD3       |       SD4       |       DNA       |    ENGLISH     |       XML       |
| :---------: | :-----------: | :-----------: | :-------------: | :-------------: | :-------------: | :-------------: | :------------: | :-------------: |
| **Dataset** | alphabet size |      255      |       64        |       16        |        4        |     16 (12)     |    239 (96)    |     97 (92)     |
|             |   file size   | 32 kb (32768) | 128 kb (131072) | 512 kb (524288) | 2 mb (2097152)  | 512 kb (524288) | 4 mb (4194304) | 1 mb (1048576)  |
|             |  actual size  | 32 kb (32768) |  96 kb (98304)  | 256 kb (262144) | 512 kb (524388) | 256 kb (262144) | 4 mb (2670016) | 896 kb (917504) |
|  **gzip**   | alphabet size |      256      |       256       |       256       |       256       |       256       |      256       |       256       |
|             |   file size   |     32811     |      99286      |     299019      |     613511      |     150118      |    1612583     |     172550      |
|             |  actual size  |     32811     |      99286      |     299019      |     613511      |     150118      |    1612583     |     172550      |
|             |     ratio     |    100.131    |     100.999     |     114.067     |     117.018     |     57.265      |     43.939     |     18.806      |
|  **bzip2**  | alphabet size |      256      |       256       |       256       |       254       |       256       |      256       |       256       |
|             |   file size   |     33231     |     999140      |     267044      |     571571      |     139452      |    1214487     |     118110      |
|             |  actual size  |     33231     |     999140      |     267044      |     571571      |     139452      |    1214487     |     118110      |
|             |     ratio     |    101.413    |     100.850     |     101.869     |     109.019     |     53.197      |   **33.092**   |   **12.873**    |
|   **xz**    | alphabet size |      256      |       256       |       256       |       256       |       256       |      256       |       256       |
|             |   file size   |     32828     |     100456      |     272100      |     573220      |     132956      |    1267892     |     134852      |
|             |  actual size  |     32828     |     100456      |     272100      |     573220      |     132956      |    1267892     |     134852      |
|             |     ratio     |    100.183    |     102.189     |     103.798     |     109.333     |   **50.719**    |     34.547     |     14.698      |



## References

- Arithmetic Coding : <https://github.com/ldematte/arithmetic_coding>
- Tunstall Code : <https://github.com/cnr-isti-vclab/corto>
- Golomb Code : <https://github.com/anirudhvr/golomb-coding>
- Static Huffman Code: <https://github.com/bhrigu123/huffman-coding>
- Adaptive Huffman Code: <https://github.com/sh1r0/adaptive-huffman-coding>
- LZ77, LZSS: <https://github.com/laz08/dictionary-encoding>
- LZ78 : <https://github.com/evilaliv3/lz78>
- LZW: <https://github.com/joeatwork/python-lzw>