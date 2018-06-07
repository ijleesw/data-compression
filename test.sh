echo "Building executables"
echo ""
stty -echo
rm result/tunstall/* > /dev/null 2>&1
rm result/golomb/* > /dev/null 2>&1
rm result/arithmetic/* > /dev/null 2>&1
rm result/gzip/* > /dev/null 2>&1
rm result/bzip2/* > /dev/null 2>&1
rm result/xz/* > /dev/null 2>&1
stty echo
make clean
make


echo "Running Tunstall Coding Compression/Decompression"
./tunstall data/SD1 result/tunstall/SD1_compressed result/tunstall/SD1_decompressed
./tunstall data/SD2 result/tunstall/SD2_compressed result/tunstall/SD2_decompressed
./tunstall data/SD3 result/tunstall/SD3_compressed result/tunstall/SD3_decompressed
./tunstall data/SD4 result/tunstall/SD4_compressed result/tunstall/SD4_decompressed
./tunstall data/dnaby result/tunstall/dnaby_compressed result/tunstall/dnaby_decompressed
./tunstall data/englishby result/tunstall/englishby_compressed result/tunstall/englishby_decompressed
./tunstall data/xmlby result/tunstall/xmlby_compressed result/tunstall/xmlby_decompressed


echo "Running Golomb Coding Compression/Decompression"
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

echo "Compression Ratio of Tunstall Coding"
./checker SD1 data/SD1 result/tunstall/SD1_compressed result/tunstall/SD1_decompressed
./checker SD2 data/SD2 result/tunstall/SD2_compressed result/tunstall/SD2_decompressed
./checker SD3 data/SD3 result/tunstall/SD3_compressed result/tunstall/SD3_decompressed
./checker SD4 data/SD4 result/tunstall/SD4_compressed result/tunstall/SD4_decompressed
./checker dnaby data/dnaby result/tunstall/dnaby_compressed result/tunstall/dnaby_decompressed
./checker englishby data/englishby result/tunstall/englishby_compressed result/tunstall/englishby_decompressed
./checker xmlby data/xmlby result/tunstall/xmlby_compressed result/tunstall/xmlby_decompressed
echo ""


echo "Compression Ratio of Golomb Coding"
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


make clean