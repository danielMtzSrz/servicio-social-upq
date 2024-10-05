<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use App\Models\EstructuraAcademica\Grupo;

use Carbon\Carbon;

class HorariosApi extends Controller
{
    public function MateriaHorario($id_grupo)
    {
        $data = Grupo::with(['aula', 'carrera', 'tutor', 'grupoMateria' => function($query) {
                $query->with(['profesor', 'materia', 'grupo'])->select(['id', 'profesor_id', 'materia_id', 'grupo_id', 'horarios']);
            }])
            ->where('id', $id_grupo)
            ->first()
            ->grupoMateria->map(function($grupo_materia) {
                $materia_nombre = isset($grupo_materia->materia->nombre) ? $grupo_materia->materia->nombre : 'Sin materia';
                $materia_horario = isset($grupo_materia->horarios) ? $grupo_materia->horarios : null;
                $materia_profesor = isset($grupo_materia->profesor) ?  $grupo_materia->profesor->name." ".$grupo_materia->profesor->apellido_paterno." ".$grupo_materia->profesor->apellido_materno : 'Sin profesor';
                return [
                    'horario_materia' => $this->transformarHorariosConCarbon($materia_nombre, $materia_horario, $materia_profesor)
                ];
            });

        return response()->json($data);
    }

    public function transformarHorariosConCarbon($materia_nombre, $materia_horario, $materia_profesor)
    {
        $diasMapa = ['lunes' => 1, 'martes' => 2, 'miercoles' => 3, 'jueves' => 4, 'viernes' => 5, 'sabado' => 6, 'domingo' => 0];
    
        $horarios = [];
    
        foreach ($diasMapa as $dia => $numeroDia) {
            if (isset($materia_horario[$dia]) && $materia_horario[$dia] === true) {
                $startTimeKey = $dia . '_hora_inicio';
                $endTimeKey = $dia . '_hora_fin';
    
                $startTime = isset($materia_horario[$startTimeKey]) ? Carbon::parse($materia_horario[$startTimeKey])->setTimezone('America/Mexico_City')->format('H:i:s') : null;
                $endTime = isset($materia_horario[$endTimeKey]) ? Carbon::parse($materia_horario[$endTimeKey])->setTimezone('America/Mexico_City')->format('H:i:s') : null;
    
                if ($startTime && $endTime) {
                    $horarios[] = [
                        'day' => $numeroDia,
                        'startTime' => $startTime,
                        'endTime' => $endTime,
                    ];
                }
            }
        }
    
        $horariosAgrupados = [];
    
        foreach ($horarios as $horario) {
            $key = $horario['startTime'] . '_' . $horario['endTime'];
            if (!isset($horariosAgrupados[$key])) {
                $horariosAgrupados[$key] = [
                    'title' => $materia_nombre,
                    'profesor' => $materia_profesor,
                    'startTime' => $horario['startTime'],
                    'endTime' => $horario['endTime'],
                    'daysOfWeek' => [],
                ];
            }
            $horariosAgrupados[$key]['daysOfWeek'][] = $horario['day'];
        }
    
        return array_values($horariosAgrupados);
    }
}
