.PHONY: gen loc build clean

gen: loc build

loc:
	dart run easy_localization:generate -S "assets/translations" -O "lib/generated"
dart run easy_localization:generate -S "assets/translations" -O "lib/generated" -f keys -o locale_keys.g.dart

clean:
	flutter clean
	flutter pub get