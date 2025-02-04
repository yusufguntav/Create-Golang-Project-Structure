PROJECT ?= default-module-name

new-project:
	# Ana klasörleri oluştur
	mkdir -p .github config document model server

	# Internal
	mkdir -p internal

	# Internal alt klasörleri
	mkdir -p internal/api \
		internal/cache \
		internal/logger \
		internal/middleware \
		internal/migration \
		internal/quickwit \
		internal/repository \
		internal/session \
		internal/usecase \
		internal/validators

	# Pkg
	mkdir -p pkg

	# Pkg alt klasörleri
	mkdir -p pkg/cloudinary \
		pkg/constant \
		pkg/cron \
		pkg/iyzipay \
		pkg/postgresql \
		pkg/quickwit \
		pkg/redis \
		pkg/sms \
		pkg/util \
		pkg/whatsapp \
		pkg/prometheus

	# Boş dosyalar oluştur
	touch docker-compose.yml Dockerfile Dockerfile.dev local.yml .env go.sum

	# main.go dosyasını oluştur
	echo 'package main\n\nimport "fmt"\n\nfunc main() {\n\tfmt.Println("Hello, World!")\n}' > main.go

	# Go modülü başlat
	go mod init $(PROJECT)

	# Gerekli bağımlılıkları yükle
	go get github.com/labstack/echo/v4
