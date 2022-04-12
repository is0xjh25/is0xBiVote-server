class VoteSerializer < ActiveModel::Serializer
    attributes :id, :name, :category, :start_time, :end_time, :status, :statistics

    def statistics
        
        data={}
        
        data[:yes] = count_vote_two('yes')
        data[:no] = count_vote_two('no')
        data[:leading] = find_leading
        data[:not_interested] = count_vote_two('not_interested')
        data[:change_mind] = count_change_mind
        data[:inspired_by_others] = count_inspired_by_others
        data[:hard_to_tell] = count_vote_two('no_opinion')

        return data
    end

    private

    def count_vote_two(selection)
        
        query = 
            "SELECT COUNT (*) FROM vote_records
            WHERE vote_id = #{object.id} AND vote_two = '#{selection}'"
        
        res = ActiveRecord::Base.connection.execute(query)
        output = res[0]['count']
        
        return output
    end

    def find_leading
        if count_vote_two('yes') > count_vote_two('no')
            return 'yes'
        elsif count_vote_two('no') > count_vote_two('yes')
            return 'no'
        else
            return 'tie'
        end
    end

    def count_change_mind
        
        query = 
            "SELECT COUNT(*) FROM vote_records
            WHERE vote_id = #{object.id} AND vote_one != vote_two AND vote_one != 'no_opinion'"
        
        res = ActiveRecord::Base.connection.execute(query)
        output = res[0]['count']
        
        return output
    end

    def count_inspired_by_others
        
        query = 
        "SELECT COUNT(*) FROM vote_records
        WHERE vote_id = #{object.id} AND vote_two != 'no_opinion' AND vote_one = 'no_opinion'"
    
        res = ActiveRecord::Base.connection.execute(query)
        output = res[0]['count']

        return output
    end
end
