require 'json'

module Api
  module V1
    class ProfilesController < ApplicationController
      def index

        #by Shubham
        # profiles = ProfileTable.find_by_sql("SELECT sourceFile FROM profile_tables WHERE status='Incomplete'")
        # jsonOutput = profiles.to_json
        # parsedJsonOutput = JSON.parse(jsonOutput)
        # datafile = parsedJsonOutput[0]['sourceFile']

        icount = ProfileTable.where(status: 'Incomplete').count
        # p "CCCCCCCCCCCCCCCCC"
        # p icount

        while icount > 0 do
          p "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
          #by Pradeep
          profiles = ProfileTable.find_by(status: "Incomplete")
          jsonOutput = profiles.sourceFile.to_json
          advocateid = profiles.advocateId.to_json
          datafile = jsonOutput


          backdir = Dir.getwd;
          Dir.chdir('public/AdvocateProfilesText')

          command = 'curl -X POST --user ********-****-****-****-********:******** --header "Content-Type: text/plain;charset=utf-8" --header "Accept: application/json"' + ' ' + "--data-binary " + '"' + "@#{datafile}" + '"' + " --output profileout.json " + '"' + "https://gateway.watsonplatform.net/personality-insights/api/v2/profile?version=2017-10-13" + '"';
          system(command)

          FileUtils.mv 'profileout.json', backdir, :force => true
          Dir.chdir(backdir)



          ibmfile = File.read('profileout.json')
          ibmOutput = JSON.parse(ibmfile)

          bigFiveMain = ibmOutput['tree']['children'][0]['children'][0]['name']
          bigFiveMainPc = ibmOutput['tree']['children'][0]['children'][0]['percentage']
          openness = ibmOutput['tree']['children'][0]['children'][0]['children'][0]['percentage']
          adventurousness = ibmOutput['tree']['children'][0]['children'][0]['children'][0]['children'][0]['percentage']
          artisticInterests = ibmOutput['tree']['children'][0]['children'][0]['children'][0]['children'][1]['percentage']
          emotionality = ibmOutput['tree']['children'][0]['children'][0]['children'][0]['children'][2]['percentage']
          imagination = ibmOutput['tree']['children'][0]['children'][0]['children'][0]['children'][3]['percentage']
          intellect = ibmOutput['tree']['children'][0]['children'][0]['children'][0]['children'][4]['percentage']
          liberalism = ibmOutput['tree']['children'][0]['children'][0]['children'][0]['children'][5]['percentage']


          conscientiousness = ibmOutput['tree']['children'][0]['children'][0]['children'][1]['percentage']
          achievementStriving = ibmOutput['tree']['children'][0]['children'][0]['children'][1]['children'][0]['percentage']
          cautiousness = ibmOutput['tree']['children'][0]['children'][0]['children'][1]['children'][1]['percentage']
          dutifulness = ibmOutput['tree']['children'][0]['children'][0]['children'][1]['children'][2]['percentage']
          orderliness = ibmOutput['tree']['children'][0]['children'][0]['children'][1]['children'][3]['percentage']
          selfDecipline = ibmOutput['tree']['children'][0]['children'][0]['children'][1]['children'][4]['percentage']
          selfEfficacy = ibmOutput['tree']['children'][0]['children'][0]['children'][1]['children'][5]['percentage']

          extroversion = ibmOutput['tree']['children'][0]['children'][0]['children'][2]['percentage']
          activityLevel = ibmOutput['tree']['children'][0]['children'][0]['children'][2]['children'][0]['percentage']
          assertiveness = ibmOutput['tree']['children'][0]['children'][0]['children'][2]['children'][1]['percentage']
          cheerfulness = ibmOutput['tree']['children'][0]['children'][0]['children'][2]['children'][2]['percentage']
          excitementSeeking = ibmOutput['tree']['children'][0]['children'][0]['children'][2]['children'][3]['percentage']
          friendliness = ibmOutput['tree']['children'][0]['children'][0]['children'][2]['children'][4]['percentage']
          gregariousness = ibmOutput['tree']['children'][0]['children'][0]['children'][2]['children'][5]['percentage']

          agreeableness = ibmOutput['tree']['children'][0]['children'][0]['children'][3]['percentage']
          altruism = ibmOutput['tree']['children'][0]['children'][0]['children'][3]['children'][0]['percentage']
          cooperation = ibmOutput['tree']['children'][0]['children'][0]['children'][3]['children'][1]['percentage']
          modesty = ibmOutput['tree']['children'][0]['children'][0]['children'][3]['children'][2]['percentage']
          morality = ibmOutput['tree']['children'][0]['children'][0]['children'][3]['children'][3]['percentage']
          sympathy = ibmOutput['tree']['children'][0]['children'][0]['children'][3]['children'][4]['percentage']
          trust = ibmOutput['tree']['children'][0]['children'][0]['children'][3]['children'][5]['percentage']

          neuroticism = ibmOutput['tree']['children'][0]['children'][0]['children'][4]['percentage']
          fiery = ibmOutput['tree']['children'][0]['children'][0]['children'][4]['children'][0]['percentage']
          proneToWorry = ibmOutput['tree']['children'][0]['children'][0]['children'][4]['children'][1]['percentage']
          melancholy = ibmOutput['tree']['children'][0]['children'][0]['children'][4]['children'][2]['percentage']
          immoderation = ibmOutput['tree']['children'][0]['children'][0]['children'][4]['children'][3]['percentage']
          selfConsciousness = ibmOutput['tree']['children'][0]['children'][0]['children'][4]['children'][4]['percentage']
          susceptibleToStress = ibmOutput['tree']['children'][0]['children'][0]['children'][4]['children'][5]['percentage']

          needsMain = ibmOutput['tree']['children'][1]['children'][0]['name']
          needsMainPc = ibmOutput['tree']['children'][1]['children'][0]['percentage']
          challenge = ibmOutput['tree']['children'][1]['children'][0]['children'][0]['percentage']
          closeness = ibmOutput['tree']['children'][1]['children'][0]['children'][1]['percentage']
          curiosity = ibmOutput['tree']['children'][1]['children'][0]['children'][2]['percentage']
          excitement = ibmOutput['tree']['children'][1]['children'][0]['children'][3]['percentage']
          harmony = ibmOutput['tree']['children'][1]['children'][0]['children'][4]['percentage']
          ideal = ibmOutput['tree']['children'][1]['children'][0]['children'][5]['percentage']
          liberty = ibmOutput['tree']['children'][1]['children'][0]['children'][6]['percentage']
          love = ibmOutput['tree']['children'][1]['children'][0]['children'][7]['percentage']
          practicality = ibmOutput['tree']['children'][1]['children'][0]['children'][8]['percentage']
          selfExpression = ibmOutput['tree']['children'][1]['children'][0]['children'][9]['percentage']
          stability = ibmOutput['tree']['children'][1]['children'][0]['children'][10]['percentage']
          structure = ibmOutput['tree']['children'][1]['children'][0]['children'][11]['percentage']

          valuesMain = ibmOutput['tree']['children'][2]['children'][0]['name']
          valuesMainPc = ibmOutput['tree']['children'][2]['children'][0]['percentage']
          conservation = ibmOutput['tree']['children'][2]['children'][0]['children'][0]['percentage']
          opennessToChange = ibmOutput['tree']['children'][2]['children'][0]['children'][1]['percentage']
          hedonism = ibmOutput['tree']['children'][2]['children'][0]['children'][2]['percentage']
          selfEnhancement = ibmOutput['tree']['children'][2]['children'][0]['children'][3]['percentage']
          selfTranscendence = ibmOutput['tree']['children'][2]['children'][0]['children'][4]['percentage']




          advocateid.gsub!(/\A"|"\Z/, '')


          user = ProfileTable.find_by(advocateId: advocateid)
          user.update(bigFiveMain: bigFiveMain, bigFiveMainPerc: bigFiveMainPc, needsMain: needsMain, needsMainPerc: needsMainPc, valuesMain: valuesMain, valuesMainPerc: valuesMainPc, status: 'Completed')
          p "$$$$$$$$$$$$$$$$$$$$$$$$$$"
          p user.errors


          b5profiles = BigFiveTable.find_by(advocateId: advocateid)
          if(b5profiles)
              b5profiles.update(bigFiveMain: bigFiveMain, bigFiveMainPerc: bigFiveMainPc, openness: openness, conscientiousness: conscientiousness, extroversion: extroversion, agreeableness: agreeableness, emotionalRange: emotionality, adventurousness: adventurousness, artisticInterests: artisticInterests, emotionality: emotionality, imagination: imagination, intellect: intellect, authorityChallenging: liberalism, achievementStriving: achievementStriving, cautiousness: cautiousness,
              dutifulness: dutifulness, orderliness: orderliness, selfDiscipline: selfDecipline, selfEfficacy: selfEfficacy, activityLevel: activityLevel, assertiveness: assertiveness, cheerfulness: cheerfulness, excitementSeeking: excitementSeeking, outgoing: friendliness, gregariousness: gregariousness, altruism: altruism, cooperation: cooperation, modesty: modesty, uncompromising: morality, sympathy: sympathy, trust: trust, fiery: fiery, proneToWorry: proneToWorry, melancholy: melancholy,
              immoderation: immoderation, selfConsciousness: selfConsciousness, susceptibleToStress: susceptibleToStress)

          else
              BigFiveTable.create(advocateId: advocateid, bigFiveMain: bigFiveMain, bigFiveMainPerc: bigFiveMainPc, openness: openness, conscientiousness: conscientiousness, extroversion: extroversion, agreeableness: agreeableness, emotionalRange: emotionality, adventurousness: adventurousness, artisticInterests: artisticInterests, emotionality: emotionality, imagination: imagination, intellect: intellect, authorityChallenging: liberalism, achievementStriving: achievementStriving,
              cautiousness: cautiousness, dutifulness: dutifulness, orderliness: orderliness, selfDiscipline: selfDecipline, selfEfficacy: selfEfficacy, activityLevel: activityLevel, assertiveness: assertiveness, cheerfulness: cheerfulness, excitementSeeking: excitementSeeking, outgoing: friendliness, gregariousness: gregariousness, altruism: altruism, cooperation: cooperation, modesty: modesty, uncompromising: morality, sympathy: sympathy, trust: trust, fiery: fiery, proneToWorry: proneToWorry,
              melancholy: melancholy, immoderation: immoderation, selfConsciousness: selfConsciousness, susceptibleToStress: susceptibleToStress)
          end


          needprofiles = NeedsTable.find_by(advocateId: advocateid)
          if(needprofiles)
            needprofiles.update(needsMain: needsMain, needsMainPerc: needsMainPc, structure: structure, stability: stability, selfExpression: selfExpression, practicality: practicality, love: love, liberty: liberty, ideal: ideal, harmony: harmony, excitement: excitement, curiosity: curiosity, closeness: closeness, challenge: challenge)
          else
            NeedsTable.create(advocateId: advocateid, needsMain: needsMain, needsMainPerc: needsMainPc, structure: structure, stability: stability, selfExpression: selfExpression, practicality: practicality, love: love, liberty: liberty, ideal: ideal, harmony: harmony, excitement: excitement, curiosity: curiosity, closeness: closeness, challenge: challenge)
          end


          valueprofiles = ValuesTable.find_by(advocateId: advocateid)
          if(valueprofiles)
            valueprofiles.update(valuesMain: valuesMain, valuesMainPerc: valuesMainPc, selfTranscendence: selfTranscendence, selfEnhancement: selfEnhancement, hedonism: hedonism, opennessToChange: opennessToChange, conservation: conservation)
          else
            ValuesTable.create(advocateId: advocateid, valuesMain: valuesMain, valuesMainPerc: valuesMainPc, selfTranscendence: selfTranscendence, selfEnhancement: selfEnhancement, hedonism: hedonism, opennessToChange: opennessToChange, conservation: conservation)
          end

          p "$$$$$$$$$$$$$$$$$$$$$$$$$$"
          p user.errors

          icount -= 1
        end
      end
    end
  end
end
