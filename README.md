![megan rapinoe](https://cloud.githubusercontent.com/assets/2723/12370366/16ac568a-bbc3-11e5-951d-f9367476eae2.jpg)

# Rapinoe

Rapinoe helps you parse Apple Keynote files.

Primarily it's designed to help you access the metadata of a Keynote file: return how many slides there are, extract the slide previews baked into the file, tell you various details about the file itself on disk, and so on.

## Install

```sh
gem install rapinoe
```

## Usage

```ruby
rapinoe = Rapinoe.new('path/to/file.key')
rapinoe.slides
# => [Rapinoe::Slide, Rapinoe::Slide, Rapinoe::Slide, etc]

rapinoe.slides.first.preview
# => maybe the path to the file or load it into memory or something
```
