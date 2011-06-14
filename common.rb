
module Rucket
    def save_dictionary dict
        LOG.info("Saving dictionary")
        File.open("matches.json", 'w+') do |f|
            f.write(dict.to_json)
        end
    end

    def add_match key, value, dict
        if dict.has_key?(key)
            dict << value
        else
            dict[key] = [value]
        end
        LOG.info("#{nick} added match: #{key}:#{value}")
        save_dictionary dict
    end
end
