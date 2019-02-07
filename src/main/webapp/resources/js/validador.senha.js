$(document).ready(function(){
                $("#formulario").submit(function(){
                      //Aqui se quiser pode fazer outras validações, mas nesse caso farei apenas a validação de ambos campos de senha.
                      if($("#senha1").val() == $("#senha2").val()){
                               return true;
                      }
                      alert("Senhas não conferem!");
                      return false; // Aqui ele irá cancelar o submit tenha seja inválido ambas senhas.
                });
     });