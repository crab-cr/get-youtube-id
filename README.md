# get-youtube-id

[![Build Status](https://travis-ci.org/iomcr/get-youtube-id.svg?branch=master)](https://travis-ci.org/iomcr/get-youtube-id)

stole RegEx from https://gist.github.com/niquepa/4c59b7d52a15dde2367a

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     get-youtube-id:
       github: iomcr/get-youtube-id
   ```

2. Run `shards install`

## Usage

```crystal
require "get-youtube-id"

# get first youtube_id as String | Nil from a string where you expect exactly 0 or 1 youtube ids.
puts Iom::GetYoutubeId::get_youtube_id "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
# "dQw4w9WgXcQ"

# get youtube_id as Set{String} from a string where you expect 0 or more youtube ids.
puts Iom::GetYoutubeId::get_youtube_id "string with list of videos https://www.youtube.com/watch?v=dQw4w9WgXcQ https://www.youtube.com/watch?v=qEkB_SQXl20"
# Set{"dQw4w9WgXcQ","qEkB_SQXl20"}
```

## Contributing

1. Fork it (<https://github.com/iomcr/get-youtube-id/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Pass tests (`crystal spec --error-trace`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

## Contributors

- [IOM](https://github.com/iomcr) - creator and maintainer
