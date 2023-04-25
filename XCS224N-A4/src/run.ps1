if ($args[0] -eq "train_gpu")
{
    Write-Host "Test"
	CUDA_VISIBLE_DEVICES=0 python run.py train --train-src=./chr_en_data/train.chr --train-tgt=./chr_en_data/train.en --dev-src=./chr_en_data/dev.chr --dev-tgt=./chr_en_data/dev.en --vocab=vocab.json --gpu --lr=5e-4 --patience=1 --valid-niter=200 --batch-size=32 --dropout=.3
}
Elseif ($args[0] -eq "test_gpu")
{
    CUDA_VISIBLE_DEVICES=0 python run.py decode model.bin ./chr_en_data/test.chr ./chr_en_data/test.en ./submission/test_outputs.txt --gpu
}
Elseif ($args[0] -eq "train_cpu")
{
	python run.py train --train-src=./chr_en_data/train.chr --train-tgt=./chr_en_data/train.en --dev-src=./chr_en_data/dev.chr --dev-tgt=./chr_en_data/dev.en --vocab=vocab.json --lr=5e-4 --patience=1 --valid-niter=200 --batch-size=32 --dropout=.3
}
Elseif ($args[0] -eq "test_cpu")
{
    python run.py decode model.bin ./chr_en_data/test.chr ./chr_en_data/test.en ./submission/test_outputs.txt
}
Elseif ($args[0] -eq "vocab")
{
	python vocab.py --train-src=./chr_en_data/train.chr --train-tgt=./chr_en_data/train.en vocab.json
}
Else
{
	Write-Host "Invalid Option Selected"
}

