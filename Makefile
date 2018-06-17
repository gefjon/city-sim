CART_NAME=city_sim
ASSETS_CART=$(CART_NAME)_assets.p8

.PHONY: build
build: $(CART_NAME).p8

$(CART_NAME).p8: $(CART_NAME).lua $(ASSETS_CART) *.lua
	p8tool build \
	 --lua $(CART_NAME).lua \
	 --gfx $(ASSETS_CART) \
	 --gff $(ASSETS_CART) \
	 --map $(ASSETS_CART) \
	 --sfx $(ASSETS_CART) \
	 --music $(ASSETS_CART) \
	 $(CART_NAME).p8
