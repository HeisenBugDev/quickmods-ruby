require 'json'

module QuickMods

  class Mod

    attr_reader :mod, :format_version, :uid, :repo, :mod_id, :name, :nem_name, :description, :license, :urls,
                :update_url, :tags, :categories, :authors, :references, :versions, :maven_repos

    def initialize(json)
      if json
        if json.is_a? String
          @mod = JSON.parse json
          create_instance_variables
        else
          raise StandardError, 'QuickMod JSON must be in the form of a String.'
        end
      else
        raise StandardError, 'No QuickMod JSON was supplied.'
      end
    end

    def create_instance_variables
      @format_version = @mod['formatVersion']
      @uid = @mod['uid']
      @repo = @mod['repo']
      @mod_id = @mod['modId']
      @name = @mod['name']
      @nem_name = @mod['nemName']
      @description = @mod['description']
      @license = @mod['license']
      @urls = @mod['urls']
      @update_url = @mod['updateUrl']
      @tags = @mod['tags']
      @categories = @mod['categories']
      @authors = @mod['authors']
      @references = @mod['references']
      @versions = @mod['versions']
      @maven_repos = @mod['mavenRepos']
    end

  end

end