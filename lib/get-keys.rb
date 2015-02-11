require 'json'

# Return hash of server keys
# Keys must be JSON format
def get_keys( location )
    begin
        location = File.expand_path(location)
        keys = JSON.parse(File.read(location),{:symbolize_names => true})
    rescue
        return nil
    end

    return keys
end

