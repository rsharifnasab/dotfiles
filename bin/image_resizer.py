#!/bin/python3
from argparse import ArgumentParser
from PIL import Image

argparse = ArgumentParser()
argparse.add_argument("--input", "-i", type=str,
                      required=True, help="input image")
argparse.add_argument("--output", "-o", type=str,
                      default="cropped.png", help="output image to be saved")
args = argparse.parse_args()


MAX_SIZE = (800, 400)


with Image.open(args.input) as im:
    size = im.size
    print(f"original size : {size}")
    ratio = size[0] / size[1]
    if size[0] <= MAX_SIZE[0] and size[1] <= MAX_SIZE[1]:
        print("WARNING : already smaller than limit\nNo crop")
        new_dim = size
    else:
        new_dim = (
            int(ratio*MAX_SIZE[1]),
            MAX_SIZE[1]
        )

    print(f"new dimension : {new_dim}")
    resized_im = im.resize(new_dim)
    resized_im .save(args.output)
    print(f"image succesfully wrote to {args.output}")
