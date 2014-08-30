require 'json'

module QuickMods

  # Documentation based on existing documentation found at: https://02jandal.github.io/QuickModDoc/qm_spec.html
  class Mod

    # @!attribute [r] mod
    #   @return the parsed json
    # @!attribute [r] format_version
    #   @return [Integer] The version of the QuickMod format. Currently 1.
    # @!attribute [r] uid
    #   @return [String] A java package style id of the QuickMod. Has to be globally unique for the QuickMod,
    #   and should NEVER change. <author>.<modid> is a good uid,
    #   but remember it may never change as long as it's still the same mod!
    # @!attribute [r] repo
    #   @return [String] A java package style repository id of the QuickMod.
    #   Has to be globally unique for your repository, and NEVER change.
    #   Two QuickMods with the same uid and repo are considered exactly equal and will overwrite each other.
    # @!attribute [r] mod_id
    #   @return [String] The mod ID of the mod, as used by forge mods.
    #   It's the name (as used in the 'name' field in the .json file) if it's a LiteLoader mod.
    # @!attribute [r] name
    #   @return [String] A descriptive, human readable name
    # @!attribute [r] nem_name
    #   @return [String] The name of the mod in NotEnoughMods
    # @!attribute [r] description
    #   @return [String] A description of the mod
    # @!attribute [r] license
    #   @return [String] The mods license
    # @!attribute [r] urls
    #   @return An object of URL types
    # @!attribute [r] update_url
    #   @return This URL should point at the QuickMod file, and is used for updating it
    # @!attribute [r] tags
    #   @return A list of tags that apply to the mod
    # @!attribute [r] categories
    #   @return A list of categories that apply to the mod. Tags and categories might often be more or less the same.
    # @!attribute [r] authors
    #   @return Authors that have participated in the creation of the mod
    # @!attribute [r] references
    #   @return A list of all mods that are in some way referenced in the versions file
    # @!attribute [r] versions
    #   @return [Array] A list of versions
    #   @see https://02jandal.github.io/QuickModDoc/qm_versions_spec.markdown
    # @!attribute [r] maven_repos
    #   @return A list of maven base urls to search for if a downloadType is maven, or for maven dependencies
    attr_reader :mod, :format_version, :uid, :repo, :mod_id, :name, :nem_name, :description, :license, :urls,
                :update_url, :tags, :categories, :authors, :references, :versions, :maven_repos

    REQUIRED_FIELDS = [
        @format_version,
        @uid,
        @repo,
        @name,
        @update_url,
        @versions
    ]

    def initialize(json)
      if json
        if json.is_a? String
          @mod = JSON.parse json
          create_instance_variables
          check_mod_integrity
          self
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

    def check_mod_integrity
      REQUIRED_FIELDS.each do |field|
        unless field
          raise StandardError, "Required Field Not Initialized Correctly: #{field}"
        end
      end
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