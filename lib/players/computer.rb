module Players
    class Computer < Player
        def move(board)
            unless board.taken?("5")
                "5"
            else
                "1" || "3" || "7" || "9"
            end
        end
    end
end



