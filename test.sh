echo "Building executables"
echo ""
rm result/tunstall/* > /dev/null 2>&1
rm result/golomb/* > /dev/null 2>&1
rm result/arithmetic/* > /dev/null 2>&1
rm result/gzip/* > /dev/null 2>&1
rm result/bzip2/* > /dev/null 2>&1
rm result/xz/* > /dev/null 2>&1
rm result/static_huffman/* > /dev/null 2>&1
rm result/adaptive_huffman/* > /dev/null 2>&1
rm result/lz77/* > /dev/null 2>&1
rm result/lz78/* > /dev/null 2>&1
rm result/lzss/* > /dev/null 2>&1
rm result/lzw/* > /dev/null 2>&1
make clean
make


echo "Running Tunstall Code Compression/Decompression"
./tunstall data/SD1 result/tunstall/SD1_compressed result/tunstall/SD1_decompressed
./tunstall data/SD2 result/tunstall/SD2_compressed result/tunstall/SD2_decompressed
./tunstall data/SD3 result/tunstall/SD3_compressed result/tunstall/SD3_decompressed
./tunstall data/SD4 result/tunstall/SD4_compressed result/tunstall/SD4_decompressed
./tunstall data/dnaby result/tunstall/dnaby_compressed result/tunstall/dnaby_decompressed
./tunstall data/englishby result/tunstall/englishby_compressed result/tunstall/englishby_decompressed
./tunstall data/xmlby result/tunstall/xmlby_compressed result/tunstall/xmlby_decompressed


echo "Running Golomb Code Compression/Decompression"
./golomb data/SD1 result/golomb/SD1_compressed result/golomb/SD1_decompressed
./golomb data/SD2 result/golomb/SD2_compressed result/golomb/SD2_decompressed
./golomb data/SD3 result/golomb/SD3_compressed result/golomb/SD3_decompressed
./golomb data/SD4 result/golomb/SD4_compressed result/golomb/SD4_decompressed
./golomb data/dnaby result/golomb/dnaby_compressed result/golomb/dnaby_decompressed
./golomb data/englishby result/golomb/englishby_compressed result/golomb/englishby_decompressed
./golomb data/xmlby result/golomb/xmlby_compressed result/golomb/xmlby_decompressed


echo "Running Arithmetic Coding Compression/Decompression"
./arithmetic data/SD1 result/arithmetic/SD1_compressed result/arithmetic/SD1_decompressed
./arithmetic data/SD2 result/arithmetic/SD2_compressed result/arithmetic/SD2_decompressed
./arithmetic data/SD3 result/arithmetic/SD3_compressed result/arithmetic/SD3_decompressed
./arithmetic data/SD4 result/arithmetic/SD4_compressed result/arithmetic/SD4_decompressed
./arithmetic data/dnaby result/arithmetic/dnaby_compressed result/arithmetic/dnaby_decompressed
./arithmetic data/englishby result/arithmetic/englishby_compressed result/arithmetic/englishby_decompressed
./arithmetic data/xmlby result/arithmetic/xmlby_compressed result/arithmetic/xmlby_decompressed


echo "Running Static Huffman Code Compression/Decompression"
python src/main.py -c static_huffman -i data/SD1 -v
python src/main.py -c static_huffman -i data/SD2 -v
python src/main.py -c static_huffman -i data/SD3 -v
python src/main.py -c static_huffman -i data/SD4 -v
python src/main.py -c static_huffman -i data/dnaby -v
python src/main.py -c static_huffman -i data/englishby -v
python src/main.py -c static_huffman -i data/xmlby -v


echo "Running Adaptive Huffman Code Compression/Decompression"
python src/main.py -c adaptive_huffman -i data/SD1 -v
python src/main.py -c adaptive_huffman -i data/SD2 -v
python src/main.py -c adaptive_huffman -i data/SD3 -v
python src/main.py -c adaptive_huffman -i data/SD4 -v
python src/main.py -c adaptive_huffman -i data/dnaby -v
python src/main.py -c adaptive_huffman -i data/englishby -v
python src/main.py -c adaptive_huffman -i data/xmlby -v


echo "Running LZ77 Compression/Decompression"
python src/main.py -c lz77 -i data/SD1 -v
python src/main.py -c lz77 -i data/SD2 -v
python src/main.py -c lz77 -i data/SD3 -v
python src/main.py -c lz77 -i data/SD4 -v
python src/main.py -c lz77 -i data/dnaby -v
python src/main.py -c lz77 -i data/englishby -v
python src/main.py -c lz77 -i data/xmlby -v


echo "Running LZ78 Compression/Decompression"
./lz78 -i data/SD1 -o result/lz78/SD1_compressed
./lz78 -i data/SD2 -o result/lz78/SD2_compressed
./lz78 -i data/SD3 -o result/lz78/SD3_compressed
./lz78 -i data/SD4 -o result/lz78/SD4_compressed
./lz78 -i data/dnaby -o result/lz78/dnaby_compressed
./lz78 -i data/englishby -o result/lz78/englishby_compressed
./lz78 -i data/xmlby -o result/lz78/xmlby_compressed
rm -r lz78.dSYM
./lz78 -i result/lz78/SD1_compressed -o result/lz78/SD1_decompressed -d
./lz78 -i result/lz78/SD2_compressed -o result/lz78/SD2_decompressed -d
./lz78 -i result/lz78/SD3_compressed -o result/lz78/SD3_decompressed -d
./lz78 -i result/lz78/SD4_compressed -o result/lz78/SD4_decompressed -d
./lz78 -i result/lz78/dnaby_compressed -o result/lz78/dnaby_decompressed -d
./lz78 -i result/lz78/englishby_compressed -o result/lz78/englishby_decompressed -d
./lz78 -i result/lz78/xmlby_compressed -o result/lz78/xmlby_decompressed -d


echo "Running LZSS Compression/Decompression"
python src/main.py -c lzss -i data/SD1 -v
python src/main.py -c lzss -i data/SD2 -v
python src/main.py -c lzss -i data/SD3 -v
python src/main.py -c lzss -i data/SD4 -v
python src/main.py -c lzss -i data/dnaby -v
python src/main.py -c lzss -i data/englishby -v
python src/main.py -c lzss -i data/xmlby -v


echo "Running LZW Compression/Decompression"
python src/main.py -c lzw -i data/SD1 -v
python src/main.py -c lzw -i data/SD2 -v
python src/main.py -c lzw -i data/SD3 -v
python src/main.py -c lzw -i data/SD4 -v
python src/main.py -c lzw -i data/dnaby -v
python src/main.py -c lzw -i data/englishby -v
python src/main.py -c lzw -i data/xmlby -v


echo "Running Unix gzip"
cp data/SD1 result/gzip/SD1_compressed
cp data/SD2 result/gzip/SD2_compressed
cp data/SD3 result/gzip/SD3_compressed
cp data/SD4 result/gzip/SD4_compressed
cp data/dnaby result/gzip/dnaby_compressed
cp data/englishby result/gzip/englishby_compressed
cp data/xmlby result/gzip/xmlby_compressed

gzip result/gzip/SD1_compressed
gzip result/gzip/SD2_compressed
gzip result/gzip/SD3_compressed
gzip result/gzip/SD4_compressed
gzip result/gzip/dnaby_compressed
gzip result/gzip/englishby_compressed
gzip result/gzip/xmlby_compressed


echo "Running Unix bzip2"
cp data/SD1 result/bzip2/SD1_compressed
cp data/SD2 result/bzip2/SD2_compressed
cp data/SD3 result/bzip2/SD3_compressed
cp data/SD4 result/bzip2/SD4_compressed
cp data/dnaby result/bzip2/dnaby_compressed
cp data/englishby result/bzip2/englishby_compressed
cp data/xmlby result/bzip2/xmlby_compressed

bzip2 result/bzip2/SD1_compressed
bzip2 result/bzip2/SD2_compressed
bzip2 result/bzip2/SD3_compressed
bzip2 result/bzip2/SD4_compressed
bzip2 result/bzip2/dnaby_compressed
bzip2 result/bzip2/englishby_compressed
bzip2 result/bzip2/xmlby_compressed


echo "Running Unix xz"
cp data/SD1 result/xz/SD1_compressed
cp data/SD2 result/xz/SD2_compressed
cp data/SD3 result/xz/SD3_compressed
cp data/SD4 result/xz/SD4_compressed
cp data/dnaby result/xz/dnaby_compressed
cp data/englishby result/xz/englishby_compressed
cp data/xmlby result/xz/xmlby_compressed

xz result/xz/SD1_compressed
xz result/xz/SD2_compressed
xz result/xz/SD3_compressed
xz result/xz/SD4_compressed
xz result/xz/dnaby_compressed
xz result/xz/englishby_compressed
xz result/xz/xmlby_compressed
echo ""


# How to use checker:
# Add ./checker <data name> <original file path> <compressed file path> <decompressed file path>

echo "Compression Ratio of Tunstall Code"
./checker SD1 data/SD1 result/tunstall/SD1_compressed result/tunstall/SD1_decompressed
./checker SD2 data/SD2 result/tunstall/SD2_compressed result/tunstall/SD2_decompressed
./checker SD3 data/SD3 result/tunstall/SD3_compressed result/tunstall/SD3_decompressed
./checker SD4 data/SD4 result/tunstall/SD4_compressed result/tunstall/SD4_decompressed
./checker dnaby data/dnaby result/tunstall/dnaby_compressed result/tunstall/dnaby_decompressed
./checker englishby data/englishby result/tunstall/englishby_compressed result/tunstall/englishby_decompressed
./checker xmlby data/xmlby result/tunstall/xmlby_compressed result/tunstall/xmlby_decompressed
echo ""


echo "Compression Ratio of Golomb Code"
./checker SD1 data/SD1 result/golomb/SD1_compressed result/golomb/SD1_decompressed
./checker SD2 data/SD2 result/golomb/SD2_compressed result/golomb/SD2_decompressed
./checker SD3 data/SD3 result/golomb/SD3_compressed result/golomb/SD3_decompressed
./checker SD4 data/SD4 result/golomb/SD4_compressed result/golomb/SD4_decompressed
./checker dnaby data/dnaby result/golomb/dnaby_compressed result/golomb/dnaby_decompressed
./checker englishby data/englishby result/golomb/englishby_compressed result/golomb/englishby_decompressed
./checker xmlby data/xmlby result/golomb/xmlby_compressed result/golomb/xmlby_decompressed
echo ""


echo "Compression Ratio of Arithmetic Coding"
./checker SD1 data/SD1 result/arithmetic/SD1_compressed result/arithmetic/SD1_decompressed
./checker SD2 data/SD2 result/arithmetic/SD2_compressed result/arithmetic/SD2_decompressed
./checker SD3 data/SD3 result/arithmetic/SD3_compressed result/arithmetic/SD3_decompressed
./checker SD4 data/SD4 result/arithmetic/SD4_compressed result/arithmetic/SD4_decompressed
./checker dnaby data/dnaby result/arithmetic/dnaby_compressed result/arithmetic/dnaby_decompressed
./checker englishby data/englishby result/arithmetic/englishby_compressed result/arithmetic/englishby_decompressed
./checker xmlby data/xmlby result/arithmetic/xmlby_compressed result/arithmetic/xmlby_decompressed
echo ""


echo "Compression Ratio of Static Huffman Code"
./checker SD1 data/SD1 result/static_huffman/SD1_compressed result/static_huffman/SD1_decompressed
./checker SD2 data/SD2 result/static_huffman/SD2_compressed result/static_huffman/SD2_decompressed
./checker SD3 data/SD3 result/static_huffman/SD3_compressed result/static_huffman/SD3_decompressed
./checker SD4 data/SD4 result/static_huffman/SD4_compressed result/static_huffman/SD4_decompressed
./checker dnaby data/dnaby result/static_huffman/dnaby_compressed result/static_huffman/dnaby_decompressed
./checker englishby data/englishby result/static_huffman/englishby_compressed result/static_huffman/englishby_decompressed
./checker xmlby data/xmlby result/static_huffman/xmlby_compressed result/static_huffman/xmlby_decompressed
echo ""


echo "Compression Ratio of Adaptive Huffman Code"
./checker SD1 data/SD1 result/adaptive_huffman/SD1_compressed result/adaptive_huffman/SD1_decompressed
./checker SD2 data/SD2 result/adaptive_huffman/SD2_compressed result/adaptive_huffman/SD2_decompressed
./checker SD3 data/SD3 result/adaptive_huffman/SD3_compressed result/adaptive_huffman/SD3_decompressed
./checker SD4 data/SD4 result/adaptive_huffman/SD4_compressed result/adaptive_huffman/SD4_decompressed
./checker dnaby data/dnaby result/adaptive_huffman/dnaby_compressed result/adaptive_huffman/dnaby_decompressed
./checker englishby data/englishby result/adaptive_huffman/englishby_compressed result/adaptive_huffman/englishby_decompressed
./checker xmlby data/xmlby result/adaptive_huffman/xmlby_compressed result/adaptive_huffman/xmlby_decompressed
echo ""


echo "Compression Ratio of LZ77"
./checker SD1 data/SD1 result/lz77/SD1_compressed result/lz77/SD1_decompressed
./checker SD2 data/SD2 result/lz77/SD2_compressed result/lz77/SD2_decompressed
./checker SD3 data/SD3 result/lz77/SD3_compressed result/lz77/SD3_decompressed
./checker SD4 data/SD4 result/lz77/SD4_compressed result/lz77/SD4_decompressed
./checker dnaby data/dnaby result/lz77/dnaby_compressed result/lz77/dnaby_decompressed
./checker englishby data/englishby result/lz77/englishby_compressed result/lz77/englishby_decompressed
./checker xmlby data/xmlby result/lz77/xmlby_compressed result/lz77/xmlby_decompressed
echo ""


echo "Compression Ratio of LZ78"
./checker SD1 data/SD1 result/lz78/SD1_compressed result/lz78/SD1_decompressed
./checker SD2 data/SD2 result/lz78/SD2_compressed result/lz78/SD2_decompressed
./checker SD3 data/SD3 result/lz78/SD3_compressed result/lz78/SD3_decompressed
./checker SD4 data/SD4 result/lz78/SD4_compressed result/lz78/SD4_decompressed
./checker dnaby data/dnaby result/lz78/dnaby_compressed result/lz78/dnaby_decompressed
./checker englishby data/englishby result/lz78/englishby_compressed result/lz78/englishby_decompressed
./checker xmlby data/xmlby result/lz78/xmlby_compressed result/lz78/xmlby_decompressed
echo ""


echo "Compression Ratio of LZSS"
./checker SD1 data/SD1 result/lzss/SD1_compressed result/lzss/SD1_decompressed
./checker SD2 data/SD2 result/lzss/SD2_compressed result/lzss/SD2_decompressed
./checker SD3 data/SD3 result/lzss/SD3_compressed result/lzss/SD3_decompressed
./checker SD4 data/SD4 result/lzss/SD4_compressed result/lzss/SD4_decompressed
./checker dnaby data/dnaby result/lzss/dnaby_compressed result/lzss/dnaby_decompressed
./checker englishby data/englishby result/lzss/englishby_compressed result/lzss/englishby_decompressed
./checker xmlby data/xmlby result/lzss/xmlby_compressed result/lzss/xmlby_decompressed
echo ""


echo "Compression Ratio of LZW"
./checker SD1 data/SD1 result/lzw/SD1_compressed result/lzw/SD1_decompressed
./checker SD2 data/SD2 result/lzw/SD2_compressed result/lzw/SD2_decompressed
./checker SD3 data/SD3 result/lzw/SD3_compressed result/lzw/SD3_decompressed
./checker SD4 data/SD4 result/lzw/SD4_compressed result/lzw/SD4_decompressed
./checker dnaby data/dnaby result/lzw/dnaby_compressed result/lzw/dnaby_decompressed
./checker englishby data/englishby result/lzw/englishby_compressed result/lzw/englishby_decompressed
./checker xmlby data/xmlby result/lzw/xmlby_compressed result/lzw/xmlby_decompressed
echo ""


echo "Compression Ratio of gzip"
./checker SD1 data/SD1 result/gzip/SD1_compressed.gz -skip
./checker SD2 data/SD2 result/gzip/SD2_compressed.gz -skip
./checker SD3 data/SD3 result/gzip/SD3_compressed.gz -skip
./checker SD4 data/SD4 result/gzip/SD4_compressed.gz -skip
./checker dnaby data/dnaby result/gzip/dnaby_compressed.gz -skip
./checker englishby data/englishby result/gzip/englishby_compressed.gz -skip
./checker xmlby data/xmlby result/gzip/xmlby_compressed.gz -skip
echo ""


echo "Compression Ratio of bzip2"
./checker SD1 data/SD1 result/bzip2/SD1_compressed.bz2 -skip
./checker SD2 data/SD2 result/bzip2/SD2_compressed.bz2 -skip
./checker SD3 data/SD3 result/bzip2/SD3_compressed.bz2 -skip
./checker SD4 data/SD4 result/bzip2/SD4_compressed.bz2 -skip
./checker dnaby data/dnaby result/bzip2/dnaby_compressed.bz2 -skip
./checker englishby data/englishby result/bzip2/englishby_compressed.bz2 -skip
./checker xmlby data/xmlby result/bzip2/xmlby_compressed.bz2 -skip
echo ""


echo "Compression Ratio of xz"
./checker SD1 data/SD1 result/xz/SD1_compressed.xz -skip
./checker SD2 data/SD2 result/xz/SD2_compressed.xz -skip
./checker SD3 data/SD3 result/xz/SD3_compressed.xz -skip
./checker SD4 data/SD4 result/xz/SD4_compressed.xz -skip
./checker dnaby data/dnaby result/xz/dnaby_compressed.xz -skip
./checker englishby data/englishby result/xz/englishby_compressed.xz -skip
./checker xmlby data/xmlby result/xz/xmlby_compressed.xz -skip
echo ""


echo "Removing executables"
make clean
rm -r lz78.dSYM > /dev/null 2>&1
