class ProfesionalVinculado {
  var property universidad 
  const property honorarioPorHora = universidad.honorarioPorHora()
  const property provincias = [universidad.provincias()] 
}

class ProfesionalLitoral {
  var property universidad   
  const property provincias = ["Entre rios","Santa fe","Corrientes"]
  const property honorarioPorHora = 3000
}

class ProfesionalLibre {
  var property universidad
  var property provincias 
  var property honorarioPorHora   
}

class Universidad {
  var property provincias
  var property honorarioPorHora  
}

class Empresa {
  const property profesionalesContratados = []
  var property honorarioReferencia  


  method contratarTodos(listaProfesionales){
    profesionalesContratados.addAll(listaProfesionales)
    }
  method contratarProfesional(unProfesional) {
    profesionalesContratados.add(unProfesional)
    } 
  method cuantosEstudiaronEn(unaUniversidad) = profesionalesContratados.filter({profesional => profesional.universidad() == unaUniversidad}).size()
  method profesionalesCaros() = profesionalesContratados.filter({profesional => profesional.honorarioPorHora() > honorarioReferencia})
  method universidadesFormadoras() = profesionalesContratados.map({profesional => profesional.universidad()}).asSet()
  method profesionalBarato() = profesionalesContratados.min({profesional => profesional.honorarioPorHora()})  
  method genteAcotada() = profesionalesContratados.all({profesional => profesional.provincias().size() <= 3})
}

class SolicitantesPersonas {
  var property provincias
 
  method puedeSerAtendida(unProfesional) = unProfesional.provincias().contains(provincias)
}
class SolicitantesInstitucion{
  const property universidades //lista de universidades

  method puedeSerAtendida(unProfesional) = universidades.contains(unProfesional.universidad())
}

class SolicitantesClub{
  const property provincias //lista de provincias

  method puedeSerAtendida(unProfesional) = provincias.any({provincia => unProfesional.provincia().contains(provincia)})
}