default: run

hello:
	@ghc hello.hs
	@strip hello

image: | hello
	@docker build -t haskell-scratch:hello .

run: | image
	@docker run --rm --name hello -i -t haskell-scratch:hello

clean:
	@rm -rf hello

.PHONY: default image run
