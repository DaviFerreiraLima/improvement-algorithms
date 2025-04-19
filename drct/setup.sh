#!/bin/bash

echo "🔧 Instalando dependências do sistema..."
apt-get update && apt-get install -y libgl1-mesa-glx

echo "🐍 Criando ambiente virtual (opcional)..."
# python3 -m venv venv
# source venv/bin/activate

echo "📦 Instalando dependências Python..."
pip install torch torchvision --extra-index-url https://download.pytorch.org/whl/cu124
pip install basicsr==1.3.4.9 lmdb opencv-python pillow tb-nightly yapf

echo "📂 Clonando repositório DRCT..."
git clone https://github.com/caojiezhang/DRCT.git
cd DRCT

echo "📂 Criando diretórios..."
mkdir -p inputs_imgs
mkdir -p experiments/pretrained_models
mkdir -p results

echo "⬇️ Baixando modelo pré-treinado DRCT_SRx4.pth..."
wget -O experiments/pretrained_models/DRCT_SRx4.pth https://github.com/caojiezhang/DRCT/releases/download/v1.0/DRCT_SRx4.pth

echo "🔧 Ajustando o código para corrigir importações..."
# Corrigindo a importação no arquivo degradations.py
sed -i 's/from torchvision.transforms.functional_tensor import rgb_to_grayscale/from torchvision.transforms.functional import rgb_to_grayscale/' /usr/local/lib/python3.11/dist-packages/basicsr/data/degradations.py

echo "📝 Criando o arquivo de configuração YAML..."
cat > options/test/DRCT_custom_test.yml <<EOL
name: DRCT_Custom_Test
model_type: DRCTModel
scale: 4
num_gpu: 0
manual_seed: 0

datasets:
  test_1:
    name: MyTestImages
    type: SingleImageDataset
    dataroot_gt: None
    dataroot_lq: ./inputs_imgs
    io_backend:
      type: disk
    phase: test
    scale: 4

network_g:
  type: DRCT
  upscale: 4
  in_chans: 3
  img_size: 64
  window_size: 16
  compress_ratio: 3
  squeeze_factor: 30
  conv_scale: 0.01
  overlap_ratio: 0.5
  img_range: 1.0
  depths: [6, 6, 6, 6, 6, 6]
  embed_dim: 180
  num_heads: [6, 6, 6, 6, 6, 6]
  mlp_ratio: 2
  upsampler: pixelshuffle
  resi_connection: 1conv

path:
  pretrain_network_g: ./experiments/pretrained_models/DRCT_SRx4.pth
  strict_load_g: True
  param_key_g: params_ema
  results_root: /content/DRCT/results/DRCT_Custom_Test
  log: /content/DRCT/results/DRCT_Custom_Test
  visualization: /content/DRCT/results/DRCT_Custom_Test/visualization

val:
  save_img: True
  suffix: None
  metrics: []

dist: False
rank: 0
world_size: 1
auto_resume: False
is_train: False
EOL

echo "✅ Setup completo! Agora você pode rodar:"
echo "    python drct/test.py -opt options/test/DRCT_custom_test.yml"
