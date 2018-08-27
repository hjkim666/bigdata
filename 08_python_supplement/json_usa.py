import json 
def get_counts(sequence):
    counts = {}
    for x in sequence:
        if x in counts:
            counts[x] += 1
        else:
            counts[x] = 1
    return counts        
            
path = "usagov_bitly_data2012-03-16.txt"

f = open(path, encoding='UTF8')

record = [json.loads(line) for line in f]
print(record[0])
print(record[0]['tz'])

time_zone = [rec['tz'] for rec in record if 'tz' in rec]

counts = get_counts(time_zone)
print(counts)
print(counts['America/New_York'])

print(len(time_zone))


# top 10 뽑기 ##############################################
def top_count(count_dict, n=10):
    value_key_pairs = [(count, tz) for tz, count  in count_dict.items()]
    value_key_pairs.sort(reverse=True) 
    return value_key_pairs
print(top_count(counts))
# top 10 뽑기 (collection 파이썬 표준 라이브러리 사용)##############
from collections import Counter 
counts = Counter(time_zone)
print(counts.most_common(10))
