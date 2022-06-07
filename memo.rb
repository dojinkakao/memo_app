require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i

if memo_type == 1
    puts "メモタイトルを入力してください"

    title = gets.chomp.to_s

    puts "タイトル名: #{title}"
    puts "メモ内容を入力してください"
    puts "入力が完了しましたら、'Ctrl+D'を入力してください"

    memo = $stdin.read

    CSV.open("#{title}.csv", 'w') do |csv|
        csv << [memo]
    end

    puts "以下の内容で保存されました"

    CSV.read("#{title}.csv")
    puts "タイトル: #{title}"
    puts "---------------"
    puts "内容: #{memo}"
 
elsif memo_type == 2

    puts "読み込むファイルを入力してください(拡張子を除く)"

    title = gets.chomp.to_s

    puts "タイトル名: #{title}"
    puts "メモ内容を入力してください"
    puts "入力が完了しましたら、'Ctrl+D'を入力してください"

    memo = $stdin.read

    CSV.open("#{title}.csv", 'a') do |csv|
        csv << [memo]
    end

    puts "以下の内容で保存されました"

    CSV.read("#{title}.csv")
    puts "タイトル: #{title}"
    puts "---------------"
    puts "内容: #{memo}"
    
end

    
