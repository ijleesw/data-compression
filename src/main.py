import argparse
import codecs
import os

import lz_family.manager as manager
import lz_family.utils as utils
import lzw.lzwelch as lzwelch
from adaptive_huffman.fgk import FGK as fgk
from static_huffman.huffman import HuffmanCoding as huffman


METHODS = [
    'static_huffman',
    'adaptive_huffman',
    'lz77',
    'lzss',
    'lz78',
    'lzw'
]


def lz77_write(tokens, file):
    b = bytearray()
    for token in tokens:
        b.append(token[0])
        b.append(token[1])
        b.append(ord(token[2]))
    open(file, 'wb').write(bytes(b))


def lz78_write(tokens, file):
    b = bytearray()
    for token in tokens:
        b += token[0].to_bytes((token[0].bit_length() + 7) // 8, 'big')
        b.append(ord(token[1]))
    open(file, 'wb').write(bytes(b))


def lzss_write(tokens, file):
    b = bytearray()
    for token in tokens:
        if len(token) > 2:
            b.append(token[0])
            b.append(token[1])
            b.append(token[2])
        else:
            b.append(token[0])
            b.append(ord(token[1]))
    open(file, 'wb').write(bytes(b))


def lz77(args, com, decom):
    text = utils.readFromFile(args.inpath, 'latin-1')
    if args.verbose:
        print("\t\tEncoding...")
    bpt, tokens = manager.encodeLZ77(text, args.offset, args.length)
    print("\tBits per token: {}".format(bpt))
    lz77_write(tokens, com)

    if args.verbose:
        print("\t\tDecoding...")
    decoded_text = manager.decodeLZ77(tokens)
    utils.writeToFile(decom, decoded_text, 'latin-1')


def lz78(args, com, decom):
    text = utils.readFromFile(args.inpath, 'latin-1')
    if args.verbose:
        print("\t\tEncoding...")
    bpt, tokens = manager.encodeLZ78(text)
    print("\tBits per token: {}".format(bpt))
    lz78_write(tokens, com)

    if args.verbose:
        print("\t\tDecoding...")
    decoded_text = manager.decodeLZ78(tokens)
    utils.writeToFile(decom, decoded_text, 'latin-1')


def lzss(args, com, decom):
    text = utils.readFromFile(args.inpath, 'latin-1')
    if args.verbose:
        print("\t\tEncoding...")
    bpt, tokens = manager.encodeLZSS(text, args.offset, args.length, args.match)
    print("\tBits per token: {}".format(bpt))
    lzss_write(tokens, com)

    if args.verbose:
        print("\t\tDecoding...")
    decoded_text = manager.decodeLZSS(tokens)
    utils.writeToFile(decom, decoded_text, 'latin-1')


def lzw(args, com, decom):
    byte_text = lzwelch.readbytes(args.inpath)
    if args.verbose:
        print("\t\tEncoding...")
    encoded_text = lzwelch.compress(byte_text)
    lzwelch.writebytes(com, encoded_text)

    byte_text = lzwelch.readbytes(com)
    if args.verbose:
        print("\t\tDecoding...")
    decoded_text = lzwelch.decompress(byte_text)
    with open(decom, 'wb') as f:
        for bt in decoded_text:
            f.write(bt)


def static_huffman(args, com, decom):
    h = huffman(args.inpath, com, decom)
    if args.verbose:
        print("\t\tEncoding...")
    h.compress()

    if args.verbose:
        print("\t\tDecoding...")
    h.decompress(com)


def adaptive_huffman(args, com, decom):
    text = utils.readFromFile(args.inpath, 'latin-1')
    if args.verbose:
        print("\t\tEncoding...")
    encoded_text = fgk().encode(text)
    utils.writeToFile(com, encoded_text, 'utf-8')

    if args.verbose:
        print("\t\tDecoding...")
    decoded_text = fgk().decode(encoded_text)
    utils.writeToFile(decom, decoded_text, 'latin-1')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-c', '--compression', default=None, help='compression method to use', required=True)
    parser.add_argument('-i', '--inpath', default=None, help='path to input file', required=True)
    parser.add_argument('-o', '--offset', default=10, type=int, help='lZ77 offset')
    parser.add_argument('-l', '--length', default=10, type=int, help='lZ77 length')
    parser.add_argument('-m', '--match', default=1, type=int, help='lZSS match')
    parser.add_argument('-v', '--verbose', action='store_true', help='print progress')
    args = parser.parse_args()

    if args.compression not in METHODS:
        print("choose a valid compression method")
        exit()

    inpath_dir, inpath_file = os.path.split(args.inpath)
    outpath_com = os.path.join(inpath_dir, '../result/{}/{}_compressed'.format(args.compression, inpath_file))
    outpath_decom = os.path.join(inpath_dir, '../result/{}/{}_decompressed'.format(args.compression, inpath_file))

    if args.verbose:
        print("\tMethod:\t{}".format(args.compression))
        print("\tFile:\t{}".format(inpath_file))

    eval(args.compression)(args, outpath_com, outpath_decom)


if __name__ == "__main__":
   main()
