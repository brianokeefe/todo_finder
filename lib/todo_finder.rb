require 'todo_finder/version'

module TodoFinder
  class Finder
    attr_accessor :matches

    def initialize
      @matches = Hash.new { |h,k| h[k]=[] }
    end

    # Find all TODOs in given dir and stuff them in a hash keyed by file
    def find(dir='.')
      full_dir = File.expand_path File.join(Dir.pwd, dir, '**', '*')
      all_files = Dir[full_dir].reject { |file| File.directory? file }

      all_files.each do |file_name|
        File.open file_name do |file|
          file.each_line do |line|
            @matches[file_name] << line if line =~ /TODO/
          end
        end
      end

      return self
    end

    # Pretty output
    def output
      @matches.each do |file, lines|
        file_name = file.gsub(Dir.pwd, '')
        puts file_name

        lines.each do |line|
          puts '  - ' << line.strip
        end

        puts ''
      end
    end
  end
end
