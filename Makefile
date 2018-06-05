TARGET = tunstall golomb arithmetic checker

all: $(TARGET)

tunstall: src/tunstall/main.cpp src/tunstall/tunstall.hpp src/tunstall/readfile.hpp
	@g++ -O2 -std=c++11 -o tunstall src/tunstall/main.cpp
	
golomb: src/golomb/main.c src/golomb/encode.h src/golomb/encode.c src/golomb/readfile.c
	@gcc -O2 -o golomb src/golomb/main.c src/golomb/encode.c src/golomb/readfile.c -lz -lm

arithmetic: src/arithmetic/main.cpp src/arithmetic/adaptive_model.h src/arithmetic/common.h 	\
			src/arithmetic/arithmetic_encoder.h src/arithmetic/arithmetic_decoder.h 	\
			src/arithmetic/difference_adaptive_model.h src/arithmetic/index.h src/arithmetic/model.h 	\
			src/arithmetic/types.h src/arithmetic/u_file_map.h src/arithmetic/u_file_writer.h
	@g++ -O2 -std=c++11 -o arithmetic src/arithmetic/main.cpp

checker: src/checker/main.cpp src/checker/readfile.hpp
	@g++ -std=c++11 -o checker src/checker/main.cpp

clean:
	@$(RM) $(TARGET)