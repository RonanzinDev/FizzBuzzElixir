defmodule FizzBuzz do
  # aqui é caso a função retorne ok
  #Chamando o arquivo
  def build(file_name) do
    file_name |> File.read() |> handle_file_read # = handle_file_read(File.read(file_name))
  end
  
  #verificando se ele existe, e chamando a função para converter para inteiro
  defp handle_file_read({:ok, resultado}) do
    # 1,2,3,4 -> [1,2,3,4]
    result = 
      resultado |> String.split(",") |> Enum.map(&converter_elevar/1)
      {:ok, result}
  end
  
  # e aqui é caso a função retorne um error se o arquivo não existir
  defp handle_file_read({:error, motivo}), do: {:error, "Error ao achar o arquivo: #{motivo}"}
  
  #função para converter os numerors para inteiro
  defp converter_elevar(elemento) do
    elemento |> String.to_integer() |> avaliar_numeros()
  end
#usando guardians e avaliando se o numero é divisivel por 3,por 5 ou pelo os 2, caso não for ele a função ira retorna apenas o numero 
  defp avaliar_numeros(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp avaliar_numeros(number) when rem(number, 3) == 0, do: :fizz
  defp avaliar_numeros(number) when rem(number, 5) == 0, do: :buzz
  defp avaliar_numeros(number), do: number
end
