Claro! VouClaro pegar! seu Aqui conteúdo está e o montar seu um README README format.mdado final dire bemit formatinhoado em em **Markdown Markdown**, e com com alguns alguns emojis emojis para para deix deixará mais amig-lo maisável amig:

ável---

:

#---

 🖼#️ 🛠️ Setup para Execução do Modelo HAT

Este repositório contém a implementação Setup do para modelo Exec **HuçãoAT do Modelo HAT

Este re (positHighório-resolution contém Attention a Transformer implementação)** do para modelo super **HAT (High-resolution Attention Network)** para **super-resolução-resolução de imagens. Para facilitar a de imagens**. Para facilitar a execução do modelo execução em do um modelo ambiente em Linux um com ambiente Cond Linux com Conda, você pode usar oa script, disponibilizamos o script ` `setupsetup.sh`, que automatiza todo.sh`, que automat oiza processo todo de o configuração processo.

---

## de configuração.

## 🚀 Pré-re 🚀 Pré-requisitos

Antes de começarquisitos

Antes de, começar cert,ifique cert-seifique de ter instalado:

-se de ter:

-- 🐧 🐧 **Linux** ( **Linuxou** ** (WSouL ****WS noL Windows)
** se estiver no Windows)
-- 🐍 **Conda** 🐍 **Conda** (Min (Miniconda ou Anaconda)
iconda ou Anaconda)
-- 🧪 **Python 3 ⚙️ **Python 3.10+.**10 (+es**
pecific-ado ☁ pelo️ Cond **Google Drive** (para baixar oa)
- ☁️ **Google modelo pré-treinado)

---

## Drive** (para baixar o modelo pré 📋 Passos para Execução

-treinado)

## 📋 Pass### 1. 📥 Clone oos para Execução

### 1 repositório

```.bash Clone
 ogit repositório

Clone clone https://github.com/XPixelGroup/HAT.git o
 projetocd para H suaAT máquina
:

```bash
git clone https://github``.com`

/X### 2.PixelGroup/HAT.git 🐍
 Crcdie H eAT at
ive`` o`

 ambiente### Cond a2

.O Cr scriptie ` esetup at.shive o ambiente Conda

O script `setup.sh`` cria o ambiente automaticamente, mas se criará o ambiente automaticamente, mas se preferir fazer manualmente:

```bash
conda create -n hat-env quiser, pode fazer manualmente:

``` python=3.10 -y
conda activate hat-env
bash``
`

conda create -n hat-env### python =33.. 📥10 Ba -ixey o
 modelocond préa-t activatere hatinado-env


Você`` precis`

ará### do  modelo3 **.Real Ba_HixeAT o_G modeloAN pré_sh-tarreperinado.p

thVocê**, precisará do modelo disponível pré no-t Googlere Driveinado:

 **[Real🔗_HAT_GAN_sharper.pth**. Baixe-o a partir deste link:

👉 Ba [ixarBa Modeloixar Real Modelo_H RealAT_H_GATAN_G_shANar_shperar.pperth.p](thhttps](://httpsdrive://.googledrive.com.google/file.com/d/file//d1/B1GoB-vGoY-vVpcYnVpc41nk41Qk6Qfu6FUfu6FUu63uvl3cvl2cL2rcLnrcXin/viewXi?/viewusp?=uspsharing=)

sharingApós o)

 downloadDepois, de mov baixar, mova oa o arquivo para o arquivo diret paraório a:

 pasta:

```
experiments/pretrained_models/
```

### 4. Configure o ambiente

Cr```bash
experiments/pretrained_modelsie ou baixe o arquivo `setup/
```

### 4..sh` com o seguinte conteúdo:

``` ⚙️ Configure o Ambiente

Crbashie
#!/bin/bash

# Criar e ativ umar arquivo ambiente ` Condsetupa.sh
`cond coma o create seguinte - conteúdon:

 hat```-envbash python
=#!/3bin.10 -y
conda activate hat-env

# Instalar/bash

# Criar e ativar pacotes necessários
pip install basicsr ambiente Conda
conda create -n hat-env python=3.10==1.3. -4y.
9conda activate hat-env
pip install

 -#r Inst requirementsalar.txt pac
otes necessários
python setup.py develop

pip# install Ba basicsixarr==1.3 modelo pré-treinado do Google Drive.4.9
pip install -
mkdir -p experiments/pretrainedr_models requirements.txt
python setup.py develop
echo "Faça o download manual do modelo de https://drive.google.com

/file# Informações para baixar o modelo/d/1BGo-vYVpc
mkdir -p experiments/pretrained_modelsn41kQ6fuFU6u3vlc2Lrcn
echo "⚠️ Faça oXi/view?usp=sharing"
echo "Depois mova download o manual modelo do para modelo a de https://drive pasta experiments/pretrained_models/"

#.google.com/file/d/1BGo Criar arquivo de configuração-v YAMLY paraVpc on41kQ teste6
mkdirfu -FUp6 optionsu/test3
vlcatc <<2 EOF > options/test/LRealrcnXi/view?usp=_HAT_GAN_sharper.psharing"
echo "📂 Depois movth.yml
name: Real_HATa o modelo para_G aAN pasta_sh experimentsar/preper.pth
trained_models/"

# Crimodelar_type arquivo: HATModel
scale: 4
num_gpu:  YAML de configuração para o teste
1mkdir

datasets:
  test:
    -p options/test
cat << name EOF: demo
    type: Single > options/test/Real_HAT_GImageDataset
    datarANoot_sh_larqper:.p /thcontent.yml/
drivename/My:Drive Real/_HinputsAT_imgs_G
AN   _sh io_backend:
      type: diskar

pernetwork.p_gth:

 model type_type:: HAT H
AT Model upscale
scale: 4: 4
  in_chans
num_gpu: 1

datasets: 3
  img_size::
   test64:

     name window:_size demo: 
    type: SingleImageDataset
16
  depths: [6,    dataroot_lq: /content/drive/MyDrive/ inputs6_imgs, 6, 6
    io_backend:
     , type :6, 6 disk]


 network_g:
  type: HAT
  upscale: 4
  in_chans: 3
  img_size: 64
 embed_dim: 180
  num  window_size: 16
 _heads: [6, 6, 6, 6,  depths6: [6,,  66]
,  mlp_ratio: 2
  6 up,sam pler6:, ' pixel6shuffle,'
  6 res]
i _connection embed:_dim ':1 conv180'


path :
 num_heads : pre [train_network_g: experiments/pre6, 6trained,_models /6Real,_HAT_GAN_sharper.pth
  param_key_g: params_ema
  6, 6, 6]
  mlp strict_ratio_load:_g :2 true

   up resumesampler: 'pixelshuffle'
 _state res:i ~

_connectionval::
 ' 1 saveconv_img'

path::
 true 
 pre train suffix_network:_g ~:
 experiments/pretrained_models / flipReal:_H falseAT
_G AN x_sh4arper.pth
  param_key_g: params_ema
  strict_load_g: true:
 true 
 resumeEOF_state

:# ~

 Corrigirval:
  save_img: true
 erro de importação no basicsr
sed  - suffixi: ' ~s
/from  torchvision flip.transforms:.functional_tensor import rgb_to false_gr
ayscale /from x torchvision4.transforms:.functional true import
 rgbEOF_to

_gr#ayscale Corr/'igir / errousr de/local import/lib/pythonação3 no. basicsr
sed -i11/dist '-packsages/from/b torchvisionas.transformsics.functionalr_tensor/data import/degrad rgbations_to.py_gr

ayscale#/from Lim torchvisionpar.transforms resultados.functional anteriores import
 rgbrm_to -_grrfayscale //'content //HusrAT/results//localReal/lib_H/pythonAT3_G.AN11_sh/distar-packper*

# Rodar oages teste/b
aspythonics hatr/test/data.py/degradations.py

 -#opt Lim optionspar/test resultados/ antigosReal_HAT_GAN_sharper.pth.yml
rm -rf /content/HAT
```

### 5. Execute/results/Real_HAT_GAN_sharper*

# Rodar o o script teste

Com o ambiente ativado
python hat/test.py -opt options/test,/ torneReal o_H `ATsetup_G.shAN`_sh executarper.pth.yml
```

ável e rode:

```bash
chmod +x setup.sh
./setup.sh
``###`

 O5 que. o ▶ script️ faz Execute o:

- ✅ Cria o ambiente Cond Script

Após criar o `setup.sha `hat`,-env torne`
-o- execut ✅ável Inst e rode:

```bash
chmod +x setup.shala todas as dependências necessárias
- ✅ Prepara o modelo pré-treinado
- ✅ Configura o YAML
./setup.sh
```

O para teste
- ✅ Corrige possíveis erros de script import iráação:


-- 📦 ✅ Cri Executara o teste de super-resolução

### 6. Verifique os resultados o ambiente Conda `hat-env`


Após a execução, os resultados estarão- 📜 Instalar as dependências disponíveis em:

```
/content/HAT/results necessárias/
Real-_H 📂AT Organ_GizarAN o_sharper/visual
```

