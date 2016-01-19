![megan rapinoe](https://cloud.githubusercontent.com/assets/2723/12370366/16ac568a-bbc3-11e5-951d-f9367476eae2.jpg)

# Rapinoe

Rapinoe helps you parse Apple Keynote files.

Primarily it's designed to help you access the simple metadata of a Keynote file: return how many slides there are, extract the slide previews baked into the file, tell you various details about the file itself on disk, and so on.

## Install

```sh
gem install rapinoe
```

## Usage

```ruby
rapinoe = Rapinoe.new('talks/Literal Best Player Ever.key')
# => <Rapinoe::Keynote: @name="Literal Best Player Ever", @path="talks/Literal Best Player Ever.key", @data=[…]>

rapinoe.write_preview_to_file("my_dope_talk.jpg")
# => Writes the higher quality 1024px-width preview of your entire deck to a file

rapinoe.slides
# => [<Rapinoe::Slide>, <Rapinoe::Slide>, <Rapinoe::Slide>, <Rapinoe::Slide>]

rapinoe.slides.first.write_preview_to_file("/tmp/slide-preview.jpg")
# => writes the Keynote-generated slide preview to a file

rapinoe.widescreen?
# => true

rapinoe.colors
# Returns the dominant colors in the first title slide by percentage order. Keys
# are in RGB format.
#
# => {[108, 190, 212]=>0.9550793650793651, [117, 124, 143]=>0.012619047619047618, [125, 83, 100]=>0.010158730158730159, [143, 23, 33]=>0.009603174603174603, [151, 10, 16]=>0.007301587301587302, [133, 49, 62]=>0.005238095238095238}
```
