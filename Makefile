.PHONY: gen loc codegen clean

gen: loc codegen

lang:
	dart run easy_localization:generate -S "assets/translations" -O "lib/generated"
	dart run easy_localization:generate -S "assets/translations" -O "lib/generated" -f keys -o locale_keys.g.dart

codegen: 
	dart run build_runner build

clean:
	flutter clean
	flutter pub get
