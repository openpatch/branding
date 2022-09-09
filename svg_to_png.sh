#!/bin/bash

logo_sizes=(32 64 128 256 512)
mkdir -p logos/png
rm -r logos/png/*
mkdir -p logos/ico
rm -r logos/ico/*
for file in logos/svg/*.svg
do
  for size in "${logo_sizes[@]}"
  do
  name=${file##*/}
  base=${name%.svg}
  inkscape $f --export-width=${size} --export-type=png --export-filename=logos/png/${base}_${size}.png $file
  done

  convert -background none -density 384 ${file} -define icon:auto-resize logos/ico/${base}.ico
done

wallpaper_sizes=(1280 1920 2560)
mkdir -p wallpapers/png
rm -r wallpapers/png/*
for size in "${wallpaper_sizes[@]}"
do
  for file in wallpapers/svg/*.svg
  do
    name=${file##*/}
    base=${name%.svg}
    inkscape $f --export-width=${size} --export-type=png --export-filename=wallpapers/png/${base}_${size}.png $file
  done
done
