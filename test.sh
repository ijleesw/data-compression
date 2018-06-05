echo "Building executables"
echo ""
rm result/tunstall/*
rm result/golomb/*
rm result/arithmetic/*
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


make clean