import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VetHorario {
  final int vetId;
  final String vetName;
  final String branchDirection;
  final TimeOfDay startTime;
  final TimeOfDay endTime;

  VetHorario({
    required this.vetId,
    required this.vetName,
    required this.branchDirection,
    required this.startTime,
    required this.endTime,
  });
}

class VetScheduleService {
  static Future<List<VetHorario>> fetchSchedules({
    required int specialityId,
    required int weekday,
  }) async {
    final response = await Supabase.instance.client
        .from('vet_schedule')
        .select('''
        vet_id,
        start_time,
        end_time,
        vet (
          name
        )
      ''')
        .eq('speciality_id', specialityId)
        .eq('weekday', weekday);

    if (response == null) {
      print('⚠️ Respuesta nula de Supabase');
      return [];
    }

    final rows = response as List;

    print('🎯 Rows obtenidos: $rows');

    return rows.map((row) {
      return VetHorario(
        vetId: row['vet_id'],
        vetName: row['vet']['name'],
        branchDirection: 'Sucursal X', // Placeholder por ahora
        startTime: _parseTime(row['start_time']),
        endTime: _parseTime(row['end_time']),
      );
    }).toList();
  }

  static Future<String?> fetchBranchDirectionForSpeciality(int specialityId) async {
    final response = await Supabase.instance.client
        .from('branch_by_specialities')
        .select('branch (direction)')
        .eq('speciality_id', specialityId)
        .limit(1);

    if (response == null || (response as List).isEmpty) return null;
    final rows = response as List;

    print('🎯 Rows obtenidos: $rows');
    return response.first['branch']['direction'];
  }



  static List<TimeOfDay> generateBlocks(TimeOfDay start, TimeOfDay end, int durationMinutes) {
    final List<TimeOfDay> blocks = [];
    TimeOfDay current = start;

    while (_isBefore(current, end)) {
      blocks.add(current);
      current = _sumMinutes(current, durationMinutes);
    }

    return blocks;
  }

  static TimeOfDay _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  static bool _isBefore(TimeOfDay a, TimeOfDay b) {
    return a.hour < b.hour || (a.hour == b.hour && a.minute < b.minute);
  }

  static TimeOfDay _sumMinutes(TimeOfDay time, int minutes) {
    final total = time.hour * 60 + time.minute + minutes;
    return TimeOfDay(hour: total ~/ 60, minute: total % 60);
  }
}
