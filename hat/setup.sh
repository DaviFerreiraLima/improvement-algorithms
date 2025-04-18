#!/bin/bash

# 🚀 Ativa o ambiente Conda (ajuste o caminho para o seu conda.sh se necessário)
conda activate hat-env

# ✅ Clona o repositório (se ainda não existir)
if [ ! -d "HAT" ]; then
    git clone https://github.com/XPixelGroup/HAT.git
fi
cd HAT

# 📦 Instala dependências
pip install basicsr==1.3.4.9
pip install -r requirements.txt
python setup.py develop

# ✅ Instala gdown se necessário
pip install gdown

# 📥 Baixa o modelo do Google Drive
MODEL_ID="1BGo-vYVpcn41kQ6fuFU6u3vlc2LrcnXi"
MODEL_PATH="experiments/pretrained_models/Real_HAT_GAN_sharper.pth"
mkdir -p experiments/pretrained_models
if [ ! -f "$MODEL_PATH" ]; then
    echo "🔽 Baixando modelo Real_HAT_GAN_sharper.pth do Google Drive..."
    gdown "https://drive.google.com/uc?id=$MODEL_ID" -O "$MODEL_PATH"
else
    echo "✅ Modelo já existe em $MODEL_PATH"
fi

# ⚠️ Corrige o import quebrado do torchvision
sed -i 's/from torchvision.transforms.functional_tensor import rgb_to_grayscale/from torchvision.transforms.functional import rgb_to_grayscale/' basicsr/data/degradations.py

# 📁 Cria opções de teste
mkdir -p options/test

# 📄 Cria o arquivo de configuração YAML
cat <<EOF > options/test/Real_HAT_GAN_sharper.pth.yml
name: Real_HAT_GAN_sharper.pth
model_type: HATModel
scale: 4
num_gpu: 1

datasets:
  test:
    name: demo
    type: SingleImageDataset
    dataroot_lq: ../inputs_imgs
    io_backend:
      type: disk

network_g:
  type: HAT
  upscale: 4
  in_chans: 3
  img_size: 64
  window_size: 16
  depths: [6, 6, 6, 6, 6, 6]
  embed_dim: 180
  num_heads: [6, 6, 6, 6, 6, 6]
  mlp_ratio: 2
  upsampler: 'pixelshuffle'
  resi_connection: '1conv'

path:
  pretrain_network_g: experiments/pretrained_models/Real_HAT_GAN_sharper.pth
  param_key_g: params_ema
  strict_load_g: true
  resume_state: ~

val:
  save_img: true
  suffix: ~
  flip: false
  x4: true
EOF

# 🧹 Limpa resultados anteriores
rm -rf results/Real_HAT_GAN_sharper*

# 🚀 Executa o teste
python hat/test.py -opt options/test/Real_HAT_GAN_sharper.pth.yml

# ✅ Mostra os arquivos de saída
echo "✅ Resultados salvos em: results/Real_HAT_GAN_sharper/visual/"
ls -lh results/Real_HAT_GAN_sharper/visual/
