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

        #by Pradeep
        profiles = ProfileTable.find_by(status: "Incomplete")
        jsonOutput = profiles.sourceFile.to_json
        advocateid = profiles.advocateId.to_json
        datafile = jsonOutput
        render plain: advocateid

        backdir = Dir.getwd;

        command = 'curl -X POST --user 1160d099-802a-410f-b582-b9b5678d5c80:EJ2ARC2i4Twf --header "Content-Type: text/plain;charset=utf-8" --header "Accept: application/json"' + ' ' + "--data-binary " + '"' + "@#{datafile}" + '"' + " --output profileout.json " + '"' + "https://gateway.watsonplatform.net/personality-insights/api/v2/profile?version=2017-10-13" + '"';


        # command = 'curl -X POST --user 1160d099-802a-410f-b582-b9b5678d5c80:EJ2ARC2i4Twf --header "Content-Type: text/plain;charset=utf-8" --header "Accept: application/json" --data-binary "@#{datafile}" --output profileout.json "https://gateway.watsonplatform.net/personality-insights/api/v2/profile?version=2017-10-13"';

        # render plain: command
        #
        # system(command)
        # render json: {message: "success"}
        # render json: {message: "success"}
        #
        #
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


        consciousness = ibmOutput['tree']['children'][0]['children'][0]['children'][1]['percentage']
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

        # # render json: ('%.5f'%selfTranscendence)
        stat = ProfileTable.where(:advocateId => advocateid).update_all(:bigFiveMain => bigFiveMain, :bigFiveMainPerc => bigFiveMainPc, :needsMain => needsMain, :needsMainPerc => needsMainPc, :valuesMain => valuesMain, :valuesMainPerc => valuesMainPc)
        p Time.current



      end
    end
  end
end
