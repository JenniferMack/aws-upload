# tmp
def aws_upload( file )
    10.times { print '.' }
end

#def make_page( imgname, imgurl )
#    page_template = File.expand_path("~/bin/lib/landing-page.erb")
#    return ERB.new(File.read(page_template)).result(binding)
#end

def status( file )
    uploadfile = File.expand_path(file)
    uploadname = File.basename(uploadfile)
    uploaddir  = File.dirname(uploadfile)

    print "Uploading: #{uploadfile}"
    aws_upload( file )
    puts "Done."
    puts( uploadfile, uploadname, uploaddir )
#    puts make_page( uploadname, uploaddir )
end

def aws_connect( bucket )
    aws = Fog::Storage.new(
        :provider              => '',
        :aws_access_key_id     => '',
        :aws_secret_access_key => ''
    )
    return aws.directories.get(bucket)
end
