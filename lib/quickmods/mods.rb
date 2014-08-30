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

    def format_version?
      if @format_version
        true
      else
        false
      end
    end

    def uid?
      if @uid
        true
      else
        false
      end
    end

    def repo?
      if @repo
        true
      else
        false
      end
    end

    def mod_id?
      if @mod_id
        true
      else
        false
      end
    end

    def name?
      if @name
        true
      else
        false
      end
    end

    def nem_name?
      if @nem_name
        true
      else
        false
      end
    end

    def description?
      if @description
        true
      else
        false
      end
    end

    def license?
      if @license
        true
      else
        false
      end
    end

    def urls?
      if @urls
        true
      else
        false
      end
    end

    def update_url?
      if @update_url
        true
      else
        false
      end
    end

    def tags?
      if @tags
        true
      else
        false
      end
    end

    def categories?
      if @categories
        true
      else
        false
      end
    end

    def authors?
      if @authors
        true
      else
        false
      end
    end

    def references?
      if @references
        true
      else
        false
      end
    end

    def versions?
      if @versions
        true
      else
        false
      end
    end

    def maven_repos?
      if @maven_repos
        true
      else
        false
      end
    end

    private

    def github(user, repo, filename, branch = 'master')
      "https://raw.github.com/#{user}/#{repo}/#{branch}/#{filename}"
    end

    def mcf(topic_id)
      "http://www.minecraftforum.net/topic/#{topic_id}"
    end

  end

end