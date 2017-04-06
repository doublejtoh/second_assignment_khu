require 'open-uri'
require 'json'

page = open("http://www.nlotto.co.kr/common.do?method=getLottoNumber")

lotto_read = page.read

lotto_json = JSON.parse(lotto_read)



winning_nums = Array.new

winning_nums.push(lotto_json["drwtNo1"])
winning_nums.push(lotto_json["drwtNo2"])
winning_nums.push(lotto_json["drwtNo3"])
winning_nums.push(lotto_json["drwtNo4"])
winning_nums.push(lotto_json["drwtNo5"])
winning_nums.push(lotto_json["drwtNo6"])


winning_nums.push(lotto_json["bnusNo"])


random_nums = Array.new # 임시 저장
random_nums_final = Array.new #6개번호 저장할 배열
for i in 1..45
    random_nums.push(i)
end

yes_or_no = "yes" 

while yes_or_no =="yes"



random_nums.shuffle!
random_nums_final=random_nums[0..5] #6개를 저장

count = 0 
bNusCnt =0 # 보너스 카운트

random_nums_final.sort!
winning_nums.sort!

print "\n뽑은 번호 : "
random_nums_final.each do
    |x|
    print "#{x} ,"
end
print "\n당첨 번호 :"
winning_nums.each do
   |x|
   print "#{x} ,"
end

for i in 0..5
    
    for j in 0..5
             
        if winning_nums[i]==random_nums_final[j]
            count+=1
        end
    end
    
end

for i in 0..5
    if random_nums_final[i]==winning_nums[6]  # 보너스cnt 체킹
        bNusCnt+=1
    end
end



print "\n "

print "당첨번호와 " 
print count 
puts" 개 일치합니다."
print "보너스번번호와 " 
print bNusCnt
puts" 개 일치합니다."

if count==6
    puts "1등입니다."
elsif count==5 && bNusCnt==1
    puts "2등입니다."
elsif count==5
    puts "3등입니다"
elsif count==4
    puts "4등입니다."
elsif count==3
    puts "5등입니다."
    
end

    
    puts "다시하시겠어요 ? 그럼 yes 입력"
    yes_or_no=gets.chomp
    
end

