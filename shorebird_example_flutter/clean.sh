#!/bin/bash

# Diretório do projeto Flutter
FLUTTER_PROJECT_DIR=$(pwd)

# Diretório extra a ser limpo (substitua pelo diretório desejado ou passe como argumento)
EXTRA_DIR=$1

# Removendo arquivos de build do Flutter
echo "Limpando arquivos de build do Flutter..."
rm -rf "$FLUTTER_PROJECT_DIR/build"
rm -rf "$FLUTTER_PROJECT_DIR/android/app/build"
rm -rf "$FLUTTER_PROJECT_DIR/ios/Pods"
rm -rf "$FLUTTER_PROJECT_DIR/ios/.symlinks"
rm -rf "$FLUTTER_PROJECT_DIR/ios/Flutter/Flutter.framework"
rm -rf "$FLUTTER_PROJECT_DIR/ios/Flutter/App.framework"
rm -rf "$FLUTTER_PROJECT_DIR/ios/Flutter/engine"

# Removendo arquivos .apk e .ipa
echo "Removendo arquivos .apk e .ipa..."
find "$FLUTTER_PROJECT_DIR" -name "*.apk" -type f -delete
find "$FLUTTER_PROJECT_DIR" -name "*.ipa" -type f -delete

# Se um diretório extra foi especificado, limpa ele também
if [ -n "$EXTRA_DIR" ]; then
  echo "Limpando diretório extra: $EXTRA_DIR"
  rm -rf "$EXTRA_DIR"
fi

echo "Limpeza concluída!"
