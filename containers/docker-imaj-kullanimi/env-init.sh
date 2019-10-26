cat > ~/Dockerfile <<EOF
FROM alpine:3.10.3

RUN apk add --no-cache bash gawk sed grep bc coreutils
EOF