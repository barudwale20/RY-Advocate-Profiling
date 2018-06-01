require 'json'

module Api
  module V1
    class CrystalsController < ApplicationController
      def index
        require 'crystal_sdk'
        CrystalSDK.key = '***********'                                          # REPLACE ACCESS CRYSTAL KEY HERE

        icount = CrystalTable.where(status: 'New').or(CrystalTable.where(status: 'Error')).count

        while icount > 0 do
          profiles = CrystalTable.find_by(status: "New")

          if(profiles)
            s = 1
          else
            profiles = CrystalTable.find_by(status: "Error")
          end

          datafile = profiles.sourceFile.to_json
          advocateid = profiles.advocateId.to_json

          backdir = Dir.getwd;
          Dir.chdir('public/AdvocateProfilesText')


          datafile.gsub!(/\A"|"\Z/, '')
          advocateid.gsub!(/\A"|"\Z/, '')


          data = File.read(datafile)

          Dir.chdir(backdir)

          cProfiles = ContactTable.find_by(advocateId: advocateid)              # get from contact db. Replece ContactTable by appropriate name
          firstName = cProfiles.firstName.to_json                               # get from contact db. Replace firstName
          lastName  = cProfiles.lastName.to_json                                # get from contact db. Replace lastName
          email     = cProfiles.email.to_json                                   # get from contact db. Replace email
          companyName = cProfiles.companyName.to_json                           # get from contact db. Replace companyName
          location = cProfiles.location.to_json                                 # get from contact db. Replace location

          firstName.gsub!(/\A"|"\Z/, '')
          lastName.gsub!(/\A"|"\Z/, '')
          email.gsub!(/\A"|"\Z/, '')
          companyName.gsub!(/\A"|"\Z/, '')
          location.gsub!(/\A"|"\Z/, '')


          begin
            query = {
              first_name: firstName,
              last_name: lastName,
              email: email,
              company_name: companyName,
              location: location,
              text_sample: data,
              text_type: "various"
            }

            profile_request = CrystalSDK::Profile::Request.from_search(query)
            profile_request_id = profile_request.id

            user = CrystalTable.find_by(advocateId: advocateid)
            stat0 = user.update(crystalId: profile_request_id)
            p profile_request_id

          rescue CrystalSDK::Profile::NotFoundError
            print "No profile was found"
            user.update(status: 'Error')

          rescue CrystalSDK::Profile::NotFoundYetError => e
            print "Profile search exceeded time limit: #{e.request.id}"
            user.update(status: 'Error')

          rescue CrystalSDK::Profile::RateLimitHitError
            print "The organization's API rate limit was hit"
            user.update(status: 'Error')

          rescue CrystalSDK::Profile::NotAuthedError => e
            print "Org token was invalid: #{e.token}"
            user.update(status: 'Error')

          rescue StandardError => e
            print "Unexpected error occurred: #{e}"
            user.update(status: 'Error')

          end

          begin

            profile = CrystalSDK::Profile.search({
              first_name: firstName,
              last_name: lastName,
              email: email,
              company_name: companyName,
              location: location,
              text_sample: data,
              text_type: "various"
              })


            fName = "#{profile.info.first_name}"
            lName = "#{profile.info.last_name}"
            discType = "#{profile.info.disc_scores.type}"
            confidence = "#{profile.info.disc_scores.confidence}"
            discImage = "#{profile.info.disc_image}"
            personalityOverview = "#{profile.recommendations.overview}"
            personalityQualities = "#{profile.recommendations.qualities}"
            motivations = "#{profile.recommendations.motivations}"
            behaviours = "#{profile.recommendations.behavior}"
            emailing = "#{profile.recommendations.emailing}"
            communication = "#{profile.recommendations.communication}"
            buildingTrust = "#{profile.recommendations.building_trust}"
            selling = "#{profile.recommendations.selling}"
            workingTogether = "#{profile.recommendations.working_together}"


            stat1 = user.update(discType: discType, confidence: confidence, discImage: discImage, personalityOverview: personalityOverview, personalityQualities: personalityQualities, likelyMotivations: motivations, likelyBehaviors: behaviours, emailing: emailing, communication: communication, buildingTrust: buildingTrust, selling: selling, workingTogether: workingTogether)

            if(stat0 && stat1)
              user.update(status: 'Completed')

            else
              p "AAAA"
              user.update(status: 'Error')

            end


          rescue CrystalSDK::Profile::NotFoundError
            print "No profile was found"
            user.update(status: 'Error')

          rescue CrystalSDK::Profile::NotFoundYetError => e
            print "Profile search exceeded time limit: #{e.request.id}"
            user.update(status: 'Error')

          rescue CrystalSDK::Profile::RateLimitHitError
            print "The organization's API rate limit was hit"
            user.update(status: 'Error')

          rescue CrystalSDK::Profile::NotAuthedError => e
            print "Org token was invalid: #{e.token}"
            user.update(status: 'Error')

          rescue StandardError => e
            print "Unexpected error occurred: #{e}"
            user.update(status: 'Error')

          end

          icount -= 1
        end
      end
    end
  end
end
