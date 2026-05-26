# Go Upgrade (Build from Source)

## Download
- https://codeload.github.com/golang/go/zip/refs/tags/go1.26.3
- https://github.com/golang/go/tags

## Build
```bash
unzip go1.26.2
cd go1.26.2
cd src
git switch go1.26.3
./make.bash
cd ../../
mv go1.26.2  ~/apps/go
```

---

# golangci-lint

## Download
- https://github.com/golangci/golangci-lint/releases/download/v2.12.2/golangci-lint-2.12.2-linux-amd64.tar.gz
- https://github.com/golangci/golangci-lint/releases

## Install
```bash
tar -xzf golangci-lint-2.12.2-linux-amd64.tar.gz
mv golangci-lint-2.12.2-linux-amd64/golangci-lint ~/bin
```

---

# PATH
```bash
export PATH="/home/roozbeh/apps/go/bin:$PATH"
```
