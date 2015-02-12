#!/usr/bin/env ruby

d = Dir.new('lib')
foo = "#!/usr/bin/env ruby\n"

begin
    d.grep(/\.rb/).each do |x|
        foo << "\n# file #{x} inserted below +~~+~~+~~+~~+~~+~~+~~+~~+\n"
        foo << File.read('lib/'+x)
    end

    foo << "\n## Main file below ------------------------------------------\n"
    foo << File.read('aws-upload')
rescue
    puts "Build failed."
end

output = File.new('foo.txt', 'w')
output.write(foo)
File.chmod(0755, 'foo.txt')

