# 初始化环境
.PHONY: init
init: init-vue init-flutter

# 初始化 vue 代码生成环境
.PHONY: init-vue
init-vue:
	go install go.einride.tech/protoc-gen-typescript-http@latest

# 初始化 flutter 代码生成环境
.PHONY: init-flutter
init-flutter:
	go install github.com/kvii/protoc-gen-kratos-dart-http@latest

# 生成所有代码
.PHONY: all
all: vue flutter

# 生成 vue 代码
.PHONY: vue
vue:
	protoc --proto_path=./greet/api/ \
	--proto_path=./greet/third_party \
	--typescript-http_out=./admin/src/proto \
	./greet/api/helloworld/v1/*.proto

# 生成 flutter 代码
.PHONY: flutter
flutter:
	protoc --proto_path=./greet/api/ \
	--proto_path=./greet/third_party \
	--kratos-dart-http_out=./app/lib/proto \
	./greet/api/helloworld/v1/*.proto \
