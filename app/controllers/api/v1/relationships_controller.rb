require 'json'

module Api
  module V1
    class RelationshipsController < ApplicationController
      def index

        require 'crystal_sdk'
        CrystalSDK.key = '************'                                         # REPLACE ACCESS CRYSTAL KEY HERE

        adv1 = "RY1"                                                            # get advocateId 1 from passed parameters
        adv2 = "RY2"                                                            # get advocateId 2 from passed parameters

        adv1.gsub!(/\A"|"\Z/, '')
        adv2.gsub!(/\A"|"\Z/, '')

        user1 = CrystalTable.find_by(advocateId: adv1)
        if(user1.to_s.bytesize > 0)
          p "YES"
          flag1 = "T"
        else
          flag1 = "F"
        end

        p flag1

        if(flag1 == "T" && (user1.status.to_json.gsub!(/\A"|"\Z/, '') == 'New' || user1.status.to_json.gsub!(/\A"|"\Z/, '') == 'Error'))
          profiles = CrystalTable.find_by(advocateId: adv1)
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

          adv1C = 0

        elsif(flag1 == "F")
          adv1C = -1

        else
          adv1C = 1
        end

        user2 = CrystalTable.find_by(advocateId: adv2)

        if(user2.to_s.bytesize > 0)
          flag2 = "T"
        else
          flag2 = "F"
        end

        p flag2
        p user2.status.to_json

        if(flag2 == "T" && (user2.status.to_json.gsub!(/\A"|"\Z/, '') == 'New' || user2.status.to_json.gsub!(/\A"|"\Z/, '') == 'Error'))
          profiles = CrystalTable.find_by(advocateId: adv2)
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

          adv2C = 0

        elsif(flag2 == "F")
          adv2C = -1

        else
          adv2C = 1
        end

        if((adv1C == 1 && adv2C == 1) || (adv1C == 1 && adv2C == 0) || (adv1C == 0 && adv2C == 1) || (adv1C == 0 && adv2C == 0))

          user1z = CrystalTable.find_by(advocateId: adv1)
          user2z = CrystalTable.find_by(advocateId: adv2)

          user1CID = user1z.crystalId.to_json
          user2CID = user2z.crystalId.to_json

          user1CID.gsub!(/\A"|"\Z/, '')
          user2CID.gsub!(/\A"|"\Z/, '')

          # REPLACE ACCESS KEY IN BELOW LINE (IN PLACE OF *)
          command = "curl --request POST --url https://connect.crystalknows.com/v1/relationships/#{user1CID}/#{user2CID} --header 'content-type:application/json;charset=utf-8' --header 'x-org-token:************'"
          command.gsub!(/\A"|"\Z/, '')
          system(command)

          #store as json file or use Recursive Openstruct to display results


        elsif (adv1C == -1 || adv2C == -1)
          p "Either of the person not in database"

        end

      end
    end
  end
end
