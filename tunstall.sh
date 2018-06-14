echo "Building executables"
rm result/tunstall/* > /dev/null 2>&1
rm tunstall > /dev/null 2>&1
rm checker > /dev/null 2>&1
make tunstall
make checker
echo ""

echo "Running Tunstall Code Compression/Decompression"
./tunstall data/SD1 result/tunstall/SD1_compressed result/tunstall/SD1_decompressed
./tunstall data/SD2 result/tunstall/SD2_compressed result/tunstall/SD2_decompressed
./tunstall data/SD3 result/tunstall/SD3_compressed result/tunstall/SD3_decompressed
./tunstall data/SD4 result/tunstall/SD4_compressed result/tunstall/SD4_decompressed
./tunstall data/dnaby result/tunstall/dnaby_compressed result/tunstall/dnaby_decompressed
./tunstall data/englishby result/tunstall/englishby_compressed result/tunstall/englishby_decompressed
./tunstall data/xmlby result/tunstall/xmlby_compressed result/tunstall/xmlby_decompressed
echo ""


echo "Compression Ratio of Tunstall Code"
./checker SD1 data/SD1 result/tunstall/SD1_compressed result/tunstall/SD1_decompressed
./checker SD2 data/SD2 result/tunstall/SD2_compressed result/tunstall/SD2_decompressed
./checker SD3 data/SD3 result/tunstall/SD3_compressed result/tunstall/SD3_decompressed
./checker SD4 data/SD4 result/tunstall/SD4_compressed result/tunstall/SD4_decompressed
./checker dnaby data/dnaby result/tunstall/dnaby_compressed result/tunstall/dnaby_decompressed
./checker englishby data/englishby result/tunstall/englishby_compressed result/tunstall/englishby_decompressed
./checker xmlby data/xmlby result/tunstall/xmlby_compressed result/tunstall/xmlby_decompressed
echo ""