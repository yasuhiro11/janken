require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

def janken
puts "じゃんけん..."
puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"

player_hand = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています
program_hand = rand(3)

# if文を使用して続きを作成していきましょう。
#ユーザーが戦わない場合、ゲーム終了
if player_hand == 3
    puts "じゃんけんが放棄されました。ゲームを終了します。"
    return false
end

janken_choices = ["グー", "チョキ", "パー"]
puts "あなた: #{janken_choices[player_hand]}, 相手: #{janken_choices[program_hand]}"

#勝敗の判定
if player_hand == program_hand
    puts "あいこです。もう一度！"
    return janken #あいこの場合はもう一度じゃんけん
elsif (player_hand == 0 && program_hand == 1) || (player_hand == 1 && program_hand == 2) || (player_hand == 2 && program_hand == 0)
    puts "じゃんけんに勝ちました！あっち向いてホイに進みます。"
    return attimuite_hoi("勝ち")
else
    puts "じゃんけんに負けました。あっち向いてホイに進みます。"
    return attimuite_hoi("負け")
    end
end

def attimuite_hoi(result)
    puts "あっち向いて..."
    puts "0(上), 1(下), 2(左), 3(右)"

    player_direction = gets.to_i #ユーザーの方向を取得
    program_direction = rand(4) #相手の方向をランダムに決定

    direction = ["上", "下", "左", "右"]
    puts "あなたの方向: #{direction[player_direction]}, 相手の方向: #{direction[program_direction]}"

    #最終勝敗の判定
    if player_direction == program_direction
        if result == "勝ち"
            puts "あなたの勝利です"
        else
            puts "あなたの負けです"
        end
        return false #ゲーム終了
    else
        puts "引き分けです"
        return true  #じゃんけんに戻る
    end
end

#　メインループ
next_game = true
while next_game
    next_game = janken
end
puts "ゲームを終了します。"
