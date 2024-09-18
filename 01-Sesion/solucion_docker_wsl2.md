
# Solución de errores Docker Desktop y WSL2

## 1. Verificar y habilitar la virtualización en el BIOS
1. Reinicia tu computadora y accede al BIOS presionando las teclas `Esc`, `F2`, `Delete` o `F10` durante el arranque (según el fabricante).
2. Dentro del BIOS, busca la opción de **Virtualización**:
   - **Intel VT-x** (para procesadores Intel) o **AMD-V** (para procesadores AMD).
   - También puede aparecer como **SVM Mode** o **Virtualization Technology**.
3. Habilita la opción de virtualización y guarda los cambios (generalmente con `F10`).

## 2. Habilitar la Plataforma de Máquina Virtual en Windows
1. Abre **PowerShell** como administrador y ejecuta los siguientes comandos para asegurarte de que **Hyper-V** y la **Plataforma de Máquina Virtual** están habilitadas:
   - Habilitar la Plataforma de Máquina Virtual:
     ```bash
     dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
     ```
   - Habilitar **Hyper-V** (requerido para Docker Desktop):
     ```bash
     dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart
     ```
2. Después, reinicia tu computadora.

## 3. Instalar y configurar WSL 2
1. Una vez habilitada la virtualización y los componentes de la máquina virtual, procede a instalar WSL 2 ejecutando los siguientes comandos en PowerShell:
   - Instalar WSL 2:
     ```bash
     wsl --install --no-distribution
     ```
   - Establecer WSL 2 como predeterminado:
     ```bash
     wsl --set-default-version 2
     ```

## 4. Verificar la instalación
1. Tras el reinicio, ejecuta el siguiente comando en PowerShell para asegurarte de que la virtualización, Hyper-V, y la Plataforma de Máquina Virtual están correctamente habilitados:
   ```bash
   systeminfo
   ```
2. Busca las líneas que confirmen que la virtualización está habilitada:
   - **Virtualización habilitada en el firmware**: Debe decir "Sí".
   - **Requisitos de Hyper-V**: Deben estar todos en "Sí".

## 5. Reintentar Docker Desktop
1. Una vez que todo esté habilitado, reinicia Docker Desktop.
2. Si el problema persiste, intenta reinstalar Docker Desktop después de asegurarte de que WSL 2 y la virtualización están correctamente configurados.

Estos pasos deberían resolver el problema. Si no logras habilitar la virtualización o sigues experimentando el error, puede ser necesario verificar actualizaciones de BIOS o del sistema operativo.
