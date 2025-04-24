# 🧠 Improvement Algorithms – Repositório de Melhoria de Imagens

Este repositório reúne testes e análises de diferentes algoritmos de *image enhancement*, com foco em reconstrução, super-resolução e transformação de qualidade visual por meio de redes neurais profundas. Cada algoritmo foi avaliado com base em sua implementação, viabilidade de execução e resultados visuais gerados.

## 📂 Estrutura do Repositório

```
improvement-algorithms/
├── atd/                      # Adaptive Token Dictionary
├── cfat/                     # Contrastive Feature Alignment Transformer
├── drct/                     # Dynamic Re-parameterization for CT Reconstruction
├── hat/                      # Hybrid Attention Transformer
├── hma/                      # Hierarchical Mask Aggregation
├── resultados_algoritmos/   # Resultados visuais dos testes
└── README.md
```

## 🧪 Algoritmos Testados

### ✅ HAT – Hybrid Attention Transformer
🔗 [Repositório](https://github.com/xpixelgroup/hat)  
📓 [Colab](https://colab.research.google.com/drive/1yIirY7Rx6C9FRFos0fIdBwiP2S51fJ9b?usp=sharing)  
📌 **Status:** Finalizado (Prioridade 1)  
📸 **Resultado:** `teste_Real_HAT_GAN_sharper.pth.png`

### ✅ DRCT – Dynamic Re-parameterization for CT Reconstruction
🔗 [Repositório](https://github.com/ming053l/DRCT)  
📓 [Colab](https://colab.research.google.com/drive/1YLJad9Clt90K5-HByIEiPaUfJ8heQXAU?usp=sharing)  
📌 **Status:** Finalizado  
📸 **Resultado:** `test_DRCT_Custom_Test.png`

### ✅ CFAT – Contrastive Feature Alignment Transformer
🔗 [Repositório](https://github.com/rayabhisek123/cfat)  
📌 **Status:** Implementado, mas exige **treinamento do zero**  
📸 **Resultado:** *Não gerado* (necessário treinamento)

### ⚠️ HMA – Hierarchical Mask Aggregation
🔗 [Repositório](https://github.com/korouuuuu/hma)  
📌 **Status:** Erro durante a implementação (código falho)  
📸 **Resultado:** *Indisponível*

### ⚠️ ATD – Adaptive Token Dictionary
🔗 [Repositório](https://github.com/labshuhanggu/adaptive-token-dictionary)  
📓 [Colab](https://colab.research.google.com/drive/1vztQwy5UKTCPYK5zUJ92z0sBkxzJHKXD?usp=sharing)  
📌 **Status:** Testado, mas com **resultados ruins**  
📸 **Resultado:** `teste_ATD_classical_SRx4.png`

## 📁 Resultados Visuais

Todos os resultados dos testes estão disponíveis na pasta `resultados_algoritmos`. Eles servem como referência visual para a qualidade de saída de cada algoritmo implementado.

## 👨‍💻 Autor

Davi Ferreira Lima  
📧 daviferreilima@gmail.com
