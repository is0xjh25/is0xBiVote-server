class VoteSerializer < ActiveModel::Serializer
    attributes :id, :name, :category, :start_time, :end_time, :status, :statistics

    def statistics
        
        data={}
        
        data[:yes] = count_yes
        data[:no] = count_no
        data[:leading] = find_leading
        data[:not_interested] = count_not_interested
        data[:change_mind] = count_change_mind
        data[:inspired_by_others] = count_inspired_by_others
        data[:hard_to_tell] = count_hard_to_tell

        return data
    end

    private

    def count_yes
        1
    end

    def count_no
        2
    end

    def find_leading
        3
    end

    def count_not_interested
    4
    end

    def count_change_mind
    5
    end

    def count_inspired_by_others
        6    
    end
        
    def count_hard_to_tell
        7
    end
end
