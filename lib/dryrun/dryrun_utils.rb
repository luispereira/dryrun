require 'open-uri'
require 'dryrun/version'

module DryRun
	class DryrunUtils

		def self.execute(command)
			is_success = system command
		      unless is_success
		        puts "\n\n======================================================\n\n"
		        puts " Something went wrong while executing this:".red
		        puts "  $ #{command}\n".yellow
		        puts "======================================================\n\n"
		        exit 1
		      end
		end

		def self.get_latest_version
		  url = 'https://raw.githubusercontent.com/cesarferreira/dryrun/master/lib/dryrun/version.rb'
		  page_string = nil

		  open(url) do |f|
		    page_string = f.read
		  end

		  page_string[/#{Regexp.escape('\'')}(.*?)#{Regexp.escape('\'')}/m, 1]
		end

		def self.is_up_to_date
		  latest = get_latest_version
		  latest.eql? DryRun::VERSION
		end
	end
end
