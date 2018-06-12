# 결과들에 대한 간단한 정리 (석원)

## 1. SD1

255개의 symbol을 uniform distribution에서 추출 -> byte 단위로 작동하는 compressor가 data에 대한 추론을 할 수가 없음 -> 압축 x



## 2. Golomb Code

### 2-1. Review of algorithms

주어진 데이터셋에서 0이 나오는 확률 _p_ 를 구한다.

_p_ 에서 _m_ 을 구하고 (수업 ppt의 notation 사용), quotient 부분은 Unary code로 처리.

Remainder부분은 lecture5의 22페이지처럼 처리.



### 2-2. Description of code

`golomb_encode` 에서 `num_set_bits`를 사용하여 0이 나오는 확률을 구한다. 그리고 `get_run_length_encoding` 으로 한 번 인코딩한 다음, `golomb_encode` 내부에서 각 symbol을 Unary code + minimal binary code로 변환해준다.



### 2-3. Discussion

_p_ 를 0이 나올 확률이라고 했을 때, p가 크거나 작아야지 압축이 잘 됨. 그래서,

(1) _p_ 가 0.5 근처인 파일들에서는 압축이 거의 되지 않음 (오히려 크기가 커지는 경우도 존재). 피피티 lecture5의 22페이지에 있는 ABR을 _p_ = 0.5로 계산해보면, 무려 1.53이 나옴. 아래는 각 파일의 _p_ 값과 압축률 (_m_ = 1로 나온 경우에는 값을 2로 바꿔줌).

- SD1: 32768 -> 38322 (0.85507:1) / _p_ = 0.494142, _m_ = 2
- SD2: 131072 -> 131322 (0.99810:1) / _p_ = 0.623410, _m_ = 2
- SD3: 524288 -> 437387 (1.19868:1) / _p_ = 0.742260, _m_ = 3
- SD4: 2097152 -> 1310590 (1.60016:1) / _p_ = 0.843772, _m_ = 5
- dnaby: 524288 -> 481347 (1.08921:1) / _p_ = 0.635737, _m_ = 2
- englishby: 4194304 -> 4629271 (0.90604:1) / _p_ = 0.550042, _m_ = 2
- xmlby: 1048576 -> 1217329 (0.86137:1) / _p_ = 0.503663, _m_ = 2

_p_ 가 커서 _m_ 값도 커져야 압축이 되기 시작하는 걸 확인할 수 있음.



## 3. Tunstall Code

### 3-1. Review of algorithms

Symbol table과 각 symbol의 probability가 주어졌을 때, 현재 tree의 leaf node 중 가장 확률이 높은 곳에서 가지를 친다. 언제까지? _k_-bit encoding을 한다면, leaf node의 수가 (2^_k_) - 1일 때까지. 그리고 input source의 데이터를 받아서 차례대로 대응되는 leaf node를 return한다.



### 3-2. Description of code

가장 먼저 `Tunstall t = Tunstall(8, 2)`로 각 encoded symbol이 8bit라는 것과 lookup table의 크기를 정해준다. 그 다음 `t.getProbabilities`, `t.createDecodingTables`, `t.createEncodingTables` 순서대로 함수를 불러 기본 세팅을 해준 뒤 `t.compress` 로 압축을 한다.



### 3-3. Discussion

Tunstall code는 tree를 expand해서 압축하는 방식인데, 결과값이 1byte = 8bit 안에 들어가야 하므로 (# of symbol)이 작은 경우에 효율적임. (tree를 더 많이 expand 할 수 있기 때문.)

- xmlby, englishby (# of symbol = 9X) 에서는 압축 잘 안 됨.
- SD2(# of symbol = 64)에서도 효율이 좋은 편은 아님.
- 대신 SD3(# of symbol = 16)에선 builtin compressor들과 동일한 압축률을, SD4(# of symbol = 4)에서는 더 좋은 효율 보임. dnaby(# of symbol = 12)에서는 builtin compressor들에 가까운 효율 보임.



## 4. Arithmetic Coding

### 4-1. Review of algorithms

주어진 interval [a,b)를 각 symbol의 probability에 맞춰 쪼개고, 들어오는 symbol에 해당되는 interval을 택한다. [0,1)에서 시작하여 더 이상 precision을 맞출 수 없을 때까지 interval을 쪼갠다.



### 4-2. Description of code

`encode_BYTE` 가 encoding을 담당한다. 입력 array가 끝날 때까지, byte를 읽고 `adaptive_model.encode_symbol` 을 부르는 것을 반복한다. `encode_symbol` 은 다시 `adaptive_encoder.encode` 를 불러 encoding을 하며, 이 함수는 32비트 int를 쪼개면서 매 bit를 `file_writer.send` 에게 보내서 output file에 출력하도록 한다.



### 4-3. Discussion

int형을 32bit binary로 보고, 이 안에 interval을 나눠서 compression을 한다. 기본적으로 arithmetic coding은 biased distribution에서 잘 작동하지만, (# of symbol)이 많아지면 매 분할에서 interval이 너무 작게 잘라져서 좋은 효율을 보이지 못한다.

- SD2는 builtin compressor들과 같은 압축률.
- (\# of symbol)이 작은 dnaby, SD3, SD4는 builtin compressor들보다 더 좋은 압축률.
- 그렇지 않은 englishby, xmlby는 상대적으로 낮은 압축률